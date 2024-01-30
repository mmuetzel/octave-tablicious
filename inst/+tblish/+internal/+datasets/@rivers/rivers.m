## Copyright (C) 1995-2007 R Core Team
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

# This is based on the rivers dataset from R’s datasets package

classdef rivers < tblish.internal.dataset

  methods

    function this = rivers
      this.name = "rivers";
      this.summary = "Lengths of Major North American Rivers";
    endfunction

    function out = load (this)
      rivers = [735, 320, 325, 392, 524, 450, 1459, 135, 465, 600, 330, 336, 280, 315, 
        870, 906, 202, 329, 290, 1000, 600, 505, 1450, 840, 1243, 890, 350, 407, 
        286, 280, 525, 720, 390, 250, 327, 230, 265, 850, 210, 630, 260, 230, 360, 
        730, 600, 306, 390, 420, 291, 710, 340, 217, 281, 352, 259, 250, 470, 680, 
        570, 350, 300, 560, 900, 625, 332, 2348, 1171, 3710, 2315, 2533, 780, 280, 
        410, 460, 260, 255, 431, 350, 760, 618, 338, 981, 1306, 500, 696, 605, 
        250, 411, 1054, 735, 233, 435, 490, 310, 460, 383, 375, 1270, 545, 445, 
        1885, 380, 300, 380, 377, 425, 276, 210, 800, 420, 350, 360, 538, 1100, 
        1205, 314, 237, 610, 360, 540, 1038, 424, 310, 300, 444, 301, 268, 620, 
        215, 652, 900, 525, 246, 360, 529, 500, 720, 270, 430, 671, 1770];
      out.rivers = rivers;
    endfunction

  endmethods

endclassdef