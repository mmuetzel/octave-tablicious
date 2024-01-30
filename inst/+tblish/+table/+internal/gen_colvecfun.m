## Copyright (C) 2019, 2023, 2024 Andrew Janke
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; If not, see <http://www.gnu.org/licenses/>.

function gen_colvecfun (maxdepth)
  %GEN_COLVECFUN Meta-function to generate the colvecfun implementation
  if nargin < 2 || isempty (maxdepth); maxdepth = 20; endif
  
  out_file = 'colvecfun_impl.txt';
  fid = fopen (out_file, 'w');
  function p(fmt, varargin)
    fprintf(fid, [fmt '\n'], varargin{:});
  endfunction
  
  p('');
  p('# The following code was generated by tblish.table.internal.gen_colvecfun');
  p('');
  p('function out = colvecfun_impl (fcn, x)');
  p('');
  p('  switch ndims (x)');
  for i = 1:maxdepth
    p('    case %d', i);
    p('      out = colvecfun_for_%d_dims (fcn, x);', i)
  endfor
  p('    otherwise');
  p('      error ("colvecfun: max ndims for input is %%d dims; got %%d dims", ...');
  p('        %d, ndims (x));', maxdepth);
  p('  endswitch');
  p('');
  p('endfunction');
  
  p('')
  p('function out = colvecfun_for_1_dims (fcn, x)');
  p('  out = fcn (x);');
  p('endfunction');
  
  for ndims = 2:maxdepth
    p('')
    p('function out = colvecfun_for_%d_dims (fcn, x)', ndims);
    ixes = repmat({'1'}, [1 ndims-1]);
    ix_expr = strjoin(ixes, ',');
    # First, do a single call with full array assignment to get correct'
    # type of output array
    p('  out1 = fcn (x(:,%s));', ix_expr);
    p('  sz = size (x);');
    p('  out = repmat(out1, [1 sz(2:end)]);');
    # Then iterate over all the columns in the array, assigning results
    # into pre-allocated output
    for depth = 1:ndims-1
      dim = ndims - depth + 1;
      indent =  repmat ('  ', [1 depth]);
      p('%sfor i_dim_%d = 1:sz(%d)', indent, dim, dim);
    endfor
    indent =  repmat ('  ', [1 ndims]);
    ixes = {};
    for i = 2:ndims
      ixes{i-1} = sprintf('i_dim_%d', i);
    endfor
    ix_expr = strjoin(ixes, ',');
    p([indent 'out(:,%s) = fcn (x(:,%s));'], ix_expr, ix_expr);
    for depth = ndims-1:-1:1
      dim = ndims - depth + 1;
      indent =  repmat ('  ', [1 depth]);
      p('%sendfor', indent);
    endfor
    p('endfunction');
  endfor
  p('');
  
  fclose (fid);
  fprintf ('Generated function is at %s\n', out_file);
  fprintf ('Now copy that into colvecfun.m\n');
  
endfunction
