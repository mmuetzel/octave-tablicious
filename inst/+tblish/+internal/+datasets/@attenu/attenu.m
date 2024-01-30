## Copyright (C) 1995-2018 R Core Team
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

# This is based on the attenu dataset from R’s datasets package

classdef attenu < tblish.internal.dataset

  methods

    function this = attenu ()
      this.name = "attenu";
      this.summary = "Joyner-Boore Earthquake Attenuation Data";
    endfunction

    function out = load (this)
      event = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 4, 4, 4, 4, ...
        4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 7, 8, 8, 8, 8, 8, 9, ...
        9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 11, ...
        11, 11, 12, 13, 13, 14, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 17, 17, ...
        17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 19, ...
        19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, ...
        19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 20, 20, 20, ...
        20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 21, ...
        21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 23, 23, ...
        23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23]';
      mag = [7, 7.4, 7.4, 7.4, ...
        7.4, 7.4, 7.4, 7.4, 7.4, 7.4, 7.4, 5.3, 6.1, 6.1, 6.1, 6.1, 6.1, 6.1, 6.1, ...
        6.1, 6.1, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 5.6, 5.7, ...
        5.3, 5.3, 5.3, 5.3, 5.3, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, ...
        6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 6.6, 5.3, 7.7, 7.7, ...
        7.7, 6.2, 5.6, 5.6, 5.2, 5.2, 5.2, 5.2, 6, 6, 6, 6, 5.1, 5.1, 5.1, 7.6, ...
        7.6, 7.6, 5.8, 5.8, 5.8, 5.8, 5.8, 5.8, 5.8, 5.8, 5.8, 5.8, 5.8, 6.5, 6.5, ...
        6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, ...
        6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, ...
        6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, ...
        5, 5, 5.8, 5.8, 5.8, 5.8, 5.8, 5.8, 5.8, 5.5, 5.5, 5.5, 5.5, 5.5, 5.5, ...
        5.5, 5.5, 5.5, 5.5, 5.3, 5.3, 5.3, 5.3, 5.3, 5.3, 5.3, 5.3, 5.3, 5.3, 5.3, ...
        5.3, 5.3, 5.3, 5.3, 5.3, 5.3, 5.3]';
      station_id =[24, 13, ...
        15, 68, 39, 74, 22, 1, 8, 55, 24, 20, 51, 13, 3, 4, 5, 6, 15, 2, 8, 60, ...
        67, 23, 58, 24, 22, 21, 37, 74, 59, 39, 14, 14, 19, 23, 70, 21, 22, 31, ...
        29, 30, 45, 58, 17, 7, 19, 26, 39, 74, 57, 59, 12, 72, 70, 37, 64, 16, ...
        18, 21, 22, 8, 62, 61, 63, 71, 105, 64, 10, 41, 8, 27, 11, 34, 32, 33, ...
        68, 107, NaN, 66, NaN, 65, 48, 52, 43, 47, 46, 44, 41, 54, 28, 50, 40, NaN, ...
        69, NaN, 75, 109, NaN, 86, 112, 110, 104, 24, 111, 87, NaN, NaN, 92, 73, 85, ...
        90, 89, NaN, 83, NaN, 102, NaN, 108, 88, 91, 93, NaN, 94, 84, NaN, 106, NaN, ...
        95, 82, 56, 87, 109, 75, 104, 110, 112, 111, 24, 73, 85, 86, 90, 89, 102, ...
        88, 92, 9, 49, 42, 38, 35, 36, 25, NaN, NaN, 9, 49, 42, NaN, 36, 38, 25, 53, ...
        79, 78, 103, 77, 80, 114, 97, 113, 76, 96, 81, 116, 99, 117, 115, 98, 101, ...
        100]';
      station_label = {"1008", "1011", "1013", "1014", "1015", ...
        "1016", "1027", "1028", "1030", "1032", "1051", "1052", "1083", "1093", ...
        "1095", "1096", "110", "1102", "111", "1117", "112", "113", "116", "117", ...
        "1219", "125", "1250", "1251", "126", "127", "128", "1291", "1292", "1293", ...
        "1298", "1299", "130", "1308", "135", "1376", "1377", "1383", "1408", "1409", ...
        "141", "1410", "1411", "1413", "1418", "1422", "1438", "1445", "1456", ...
        "1492", "2001", "2316", "262", "266", "269", "270", "2708", "2714", "2715", ...
        "272", "2728", "2734", "280", "283", "286", "290", "3501", "411", "412", ...
        "475", "5028", "5042", "5043", "5044", "5045", "5047", "5049", "5050", ...
        "5051", "5052", "5053", "5054", "5055", "5056", "5057", "5058", "5059", ...
        "5060", "5061", "5062", "5066", "5067", "5068", "5069", "5070", "5072", ...
        "5073", "5115", "5160", "5165", "655", "724", "885", "931", "942", "952", ...
        "955", "958", "c118", "c168", "c203", "c204", "c266"}';
      dist = [12, 148, ...
        42, 85, 107, 109, 156, 224, 293, 359, 370, 8, 16.1, 63.6, 6.6, 9.3, 13, ...
        17.3, 105, 112, 123, 105, 122, 141, 200, 45, 130, 147, 187, 197, 203, 211, ...
        62, 62, 19, 21, 13, 22, 29, 17, 19.6, 20.2, 21.1, 21.9, 24.2, 66, 87, 23.4, ...
        24.6, 25.7, 28.6, 37.4, 46.7, 56.9, 60.7, 61.4, 62, 64, 82, 88, 91, 31, ...
        45, 145, 300, 5, 50, 16, 17, 8, 10, 10, 8, 32, 30, 31, 2.9, 3.2, 7.6, 25.4, ...
        32.9, 92.2, 1.2, 1.6, 9.1, 3.7, 5.3, 7.4, 17.9, 19.2, 23.4, 30, 38.9, 23.5, ...
        26, 0.5, 0.6, 1.3, 1.4, 2.6, 3.8, 4, 5.1, 6.2, 6.8, 7.5, 7.6, 8.4, 8.5, ...
        8.5, 10.6, 12.6, 12.7, 12.9, 14, 15, 16, 17.7, 18, 22, 22, 23, 23.2, 29, ...
        32, 32.7, 36, 43.5, 49, 60, 64, 7.5, 8.8, 8.9, 9.4, 9.7, 9.7, 10.5, 10.5, ...
        12, 12.2, 12.8, 14.6, 14.9, 17.6, 23.9, 25, 10.8, 15.7, 16.7, 20.8, 28.5, ...
        33.1, 40.3, 4, 10.1, 11.1, 17.7, 22.5, 26.5, 29, 30.9, 37.8, 48.3, 5.8, ...
        12, 12.1, 20.5, 20.5, 25.3, 35.9, 36.1, 36.3, 38.5, 41.4, 43.6, 44.4, 46.1, ...
        47.1, 47.7, 49.2, 53.1]';
      accel = [0.359, 0.014, 0.196, 0.135, 0.062, 0.054, ...
        0.014, 0.018, 0.01, 0.004, 0.004, 0.127, 0.411, 0.018, 0.509, 0.467, 0.279, ...
        0.072, 0.012, 0.006, 0.003, 0.018, 0.048, 0.011, 0.007, 0.142, 0.031, 0.006, ...
        0.01, 0.01, 0.006, 0.013, 0.005, 0.003, 0.086, 0.179, 0.205, 0.073, 0.045, ...
        0.374, 0.2, 0.147, 0.188, 0.204, 0.335, 0.057, 0.021, 0.152, 0.217, 0.114, ...
        0.15, 0.148, 0.112, 0.043, 0.057, 0.03, 0.027, 0.028, 0.034, 0.03, 0.039, ...
        0.03, 0.11, 0.01, 0.01, 0.39, 0.031, 0.13, 0.011, 0.12, 0.17, 0.14, 0.11, ...
        0.04, 0.07, 0.08, 0.21, 0.39, 0.28, 0.16, 0.064, 0.09, 0.42, 0.23, 0.13, ...
        0.26, 0.27, 0.26, 0.11, 0.12, 0.038, 0.044, 0.046, 0.17, 0.21, 0.32, 0.52, ...
        0.72, 0.32, 0.81, 0.64, 0.56, 0.51, 0.4, 0.61, 0.26, 0.24, 0.46, 0.22, ...
        0.23, 0.28, 0.38, 0.27, 0.31, 0.2, 0.11, 0.43, 0.27, 0.15, 0.15, 0.15, ...
        0.13, 0.19, 0.13, 0.066, 0.35, 0.1, 0.16, 0.14, 0.049, 0.034, 0.264, 0.263, ...
        0.23, 0.147, 0.286, 0.157, 0.237, 0.133, 0.055, 0.097, 0.129, 0.192, 0.147, ...
        0.154, 0.06, 0.057, 0.12, 0.154, 0.052, 0.045, 0.086, 0.056, 0.065, 0.259, ...
        0.267, 0.071, 0.275, 0.058, 0.026, 0.039, 0.112, 0.065, 0.026, 0.123, 0.133, ...
        0.073, 0.097, 0.096, 0.23, 0.082, 0.11, 0.11, 0.094, 0.04, 0.05, 0.022, ...
        0.07, 0.08, 0.033, 0.017, 0.022]';

        station = categorical (station_id, 1:117, station_label);

        out = table(event, mag, station, dist, accel);
    endfunction
  
  endmethods

endclassdef
