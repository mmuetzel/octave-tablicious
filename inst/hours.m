## Copyright (C) 2019, 2023, 2024 Andrew Janke <floss@apjanke.net>
##
## This file is part of Octave.
##
## Octave is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {@var{out} =} hours (@var{x})
## Create a @code{duration} @var{x} hours long, or get the hours in a @code{duration}
## @var{x}.
##
## If input is numeric, returns a @code{duration} array that is that many hours in
## time.
##
## If input is a @code{duration}, converts the @code{duration} to a number of hours.
##
## Returns an array the same size as @var{x}.
## @end deftypefn

function out = hours (x)
  %HOURS Duration in hours
  %
  % If input is numeric, returns a @duration array that is that many hours long.
  %
  % If input is a duration, converts the duration to a number of hours.
  if isnumeric (x)
    out = duration.ofDays (double (x) / 24);
  else
    error ('Invalid input: expected numeric or duration; got %s', class (x));
  end
end
