function[totalNum,temp]=checkNum(vector)
%============================================
% function[totalNum,temp]=checkNum(vector)
%   checkNum used for claculating the total NO. of vector can return
%   the NO. of element appeare in vector 
%   NOTE:input must be a vector,the sequence of tempNum is
%   increasing
%=============================================
% clear all;
% clc;
% iii=ones(1,3894732);
% vector=[iii,0,6,7,9,5,0,0,7,24,9,9,9,23];
% vector=[1,5,11,38,132,156,173,185,1,28,79,120,144,189,255,255,1,35,49,118,132,240,255,255,1,27,29,127,218,255,255,255,1,50,141,255,255,255,255,255,1,12,147,153,188,255,255,255,1,32,134,146,217,238,255,255,1,121,145,171,255,255,255,255,1,43,98,127,203,255,255,255,1,115,162,255,255,255,255,255,1,65,116,124,169,196,255,255,1,214,239,255,255,255,255,255,1,124,240,255,255,255,255,255,1,36,51,124,142,147,206,232,1,116,122,171,214,255,255,255,1,38,67,139,174,231,255,255,1,61,74,187,254,255,255,255,1,77,100,140,165,206,228,255,1,101,164,191,237,255,255,255,1,3,56,79,87,207,255,255,1,76,107,179,211,255,255,255,1,228,233,255,255,255,255,255,1,45,65,74,213,255,255,255,1,29,176,187,214,216,255,255,1,22,45,54,57,153,205,255,1,3,87,89,108,207,255,255,1,119,214,255,255,255,255,255,1,78,144,190,212,255,255,255,1,38,154,156,195,255,255,255,1,10,52,87,232,255,255,255,1,36,122,227,255,255,255,255,1,61,206,233,255,255,255,255,1,100,190,255,255,255,255,255,1,9,154,163,200,255,255,255,1,228,233,255,255,255,255,255,1,15,57,80,96,213,232,255,1,75,218,228,250,255,255,255,1,173,255,255,255,255,255,255,1,25,145,255,255,255,255,255,1,116,215,255,255,255,255,255,1,25,57,255,255,255,255,255,1,12,239,255,255,255,255,255,1,57,83,144,215,229,232,255,1,25,141,239,255,255,255,255,1,25,49,57,98,255,255,255,1,12,25,142,198,236,255,255,1,25,95,136,144,148,255,255,1,255,255,255,255,255,255,255,1,56,58,80,182,255,255,255,1,12,66,142,255,255,255,255,1,202,214,255,255,255,255,255,1,22,67,134,172,255,255,255,1,48,147,170,242,255,255,255,1,142,147,255,255,255,255,255,1,71,100,187,255,255,255,255,1,56,71,165,255,255,255,255,1,148,255,255,255,255,255,255,1,25,62,146,174,213,233,255,1,12,72,144,252,255,255,255,1,29,71,119,141,156,255,255,1,83,94,104,223,255,255,255,1,51,143,243,255,255,255,255,1,27,32,124,168,193,255,255,1,143,181,186,255,255,255,255,1,27,48,62,214,255,255,255,1,12,255,255,255,255,255,255,1,100,148,162,191,255,255,255,1,52,118,255,255,255,255,255,1,94,214,255,255,255,255,255,1,94,100,131,255,255,255,255,1,6,94,255,255,255,255,255,1,6,94,255,255,255,255,255,1,77,117,190,255,255,255,255,1,71,73,209,255,255,255,255,1,9,71,209,255,255,255,255,1,77,94,204,255,255,255,255,1,94,183,255,255,255,255,255,1,71,99,146,255,255,255,255,1,71,85,255,255,255,255,255,1,94,121,236,255,255,255,255,1,94,112,255,255,255,255,255,1,12,28,94,202,255,255,255,1,28,94,255,255,255,255,255,1,13,18,94,255,255,255,255,1,51,94,255,255,255,255,255,1,117,189,255,255,255,255,255,1,117,142,189,255,255,255,255,1,84,117,255,255,255,255,255,1,117,124,186,255,255,255,255,1,117,250,255,255,255,255,255,1,75,117,255,255,255,255,255,1,51,117,255,255,255,255,255,1,71,232,255,255,255,255,255,1,71,106,255,255,255,255,255,1,84,94,211,255,255,255,255,1,94,146,255,255,255,255,255,1,51,133,147,255,255,255,255,1,109,165,196,255,255,255,255,1,9,154,163,200,255,255,255,1,180,255,255,255,255,255,255,1,18,105,226,255,255,255,255,1,43,147,233,255,255,255,255,1,48,116,165,255,255,255,255,1,48,98,144,255,255,255,255,1,71,210,255,255,255,255,255,1,9,106,215,236,255,255,255,1,10,173,176,186,205,255,255,1,117,186,255,255,255,255,255,1,26,152,232,255,255,255,255,1,26,152,232,255,255,255,255,1,5,20,46,67,132,135,255,1,28,46,118,148,223,228,255,1,71,210,255,255,255,255,255,1,73,116,141,216,245,255,255,1,73,116,141,216,245,255,255,1,71,210,255,255,255,255,255,1,255,255,255,255,255,255,255,1,94,169,255,255,255,255,255,1,95,225,231,255,255,255,255,1,12,17,48,99,147,233,255,1,48,98,144,209,255,255,255,1,48,255,255,255,255,255,255,1,61,124,146,239,255,255,255,1,71,75,236,255,255,255,255,1,243,255,255,255,255,255,255,1,58,217,253,255,255,255,255,1,15,16,21,56,163,232,255,1,5,12,213,255,255,255,255,1,71,255,255,255,255,255,255,1,16,25,132,140,240,255,255,1,10,51,71,193,255,255,255,1,48,144,232,239,255,255,255,1,48,110,144,232,255,255,255,1,7,25,140,255,255,255,255,1,53,71,116,255,255,255,255,1,51,71,193,255,255,255,255,1,30,56,71,145,255,255,255,1,71,74,196,255,255,255,255,1,7,71,77,255,255,255,255,1,51,71,239,255,255,255,255,1,9,48,112,232,255,255,255,1,35,48,232,255,255,255,255,1,25,140,209,255,255,255,255,1,25,75,255,255,255,255,255,1,25,120,140,143,255,255,255,1,48,84,232,255,255,255,255,1,25,120,140,255,255,255,255,1,25,120,140,252,255,255,255,1,71,255,255,255,255,255,255,1,8,71,73,255,255,255,255,1,51,71,255,255,255,255,255,1,8,25,34,140,166,255,255,1,71,73,193,255,255,255,255,1,34,71,143,255,255,255,255,1,28,48,77,232,255,255,255,1,48,227,255,255,255,255,255,1,7,9,25,140,255,255,255,1,31,255,255,255,255,255,255,1,59,102,149,153,203,239,255,1,12,25,103,255,255,255,255,1,11,71,109,118,209,255,255,1,71,213,249,255,255,255,255,1,10,71,79,100,209,214,255,1,71,123,142,249,255,255,255,1,108,137,162,255,255,255,255,1,28,71,120,189,255,255,255,1,35,71,99,106,159,209,255,1,49,71,114,191,255,255,255,1,3,16,71,255,255,255,255,1,3,48,147,255,255,255,255,1,9,71,143,213,255,255,255,1,16,44,71,106,255,255,255,1,22,70,71,105,255,255,255,1,48,255,255,255,255,255,255,1,15,71,255,255,255,255,255,1,148,214,255,255,255,255,255,1,48,77,197,236,255,255,255,1,13,22,255,255,255,255,255,1,105,167,255,255,255,255,255,1,45,66,210,238,255,255,255,1,100,255,255,255,255,255,255,1,111,187,255,255,255,255,255,1,25,79,188,255,255,255,255,1,43,104,240,255,255,255,255,1,106,255,255,255,255,255,255,1,60,114,140,255,255,255,255,1,43,122,145,161,219,239,255,1,82,154,188,190,234,255,255,1,129,241,255,255,255,255,255,1,181,216,255,255,255,255,255,1,52,96,125,255,255,255,255,1,71,171,196,214,255,255,255,1,22,209,231,237,238,255,255,1,149,159,233,255,255,255,255,1,118,141,207,252,255,255,255,1,123,173,178,196,255,255,255,1,5,12,104,133,255,255,255,1,132,159,163,222,255,255,255,1,53,141,216,255,255,255,255,1,12,72,126,139,146,233,255,1,30,124,226,251,255,255,255,1,121,162,168,180,209,210,255,1,76,107,198,244,255,255,255,1,140,146,147,172,255,255,255,1,15,16,21,255,255,255,255,1,8,34,53,63,119,255,255,1,120,237,255,255,255,255,255,1,12,16,141,211,235,255,255,1,105,255,255,255,255,255,255,1,35,58,111,178,205,232,255,1,94,255,255,255,255,255,255,1,15,84,141,233,255,255,255,1,6,41,62,129,141,201,255,1,156,241,255,255,255,255,255,1,59,109,154,183,234,255,255,1,27,62,106,135,225,255,255,1,80,159,206,255,255,255,255,1,25,70,147,148,255,255,255,1,48,147,158,190,255,255,255,1,27,61,103,107,255,255,255,1,163,166,189,214,255,255,255,1,22,71,77,214,232,255,255,1,19,26,240,255,255,255,255,1,48,235,255,255,255,255,255,1,27,62,255,255,255,255,255,1,214,233,255,255,255,255,255,1,48,98,144,255,255,255,255,1,147,148,215,255,255,255,255,1,120,123,143,236,255,255,255,1,27,166,240,255,255,255,255,1,100,103,255,255,255,255,255,1,116,118,160,223,255,255,255,1,8,132,187,212,255,255,255,1,10,61,77,245,255,255,255,1,62,144,217,236,255,255,255,1,25,255,255,255,255,255,255,1,96,101,119,242,255,255,255,1,67,79,140,191,222,255,255,1,51,58,147,168,255,255,255,1,62,70,91,108,141,187,255,1,118,121,165,255,255,255,255,1,57,97,163,196,229,255,255,1,50,70,77,204,216,253,255,1,49,80,127,188,254,255,255,1,35,41,66,127,196,255,255,1,35,207,219,222,255,255,255,1,40,181,206,227,255,255,255,1,80,145,171,219,255,255,255,1,107,170,204,207,255,255,255,1,32,77,112,166,255,255,255,1,60,69,255,255,255,255,255,1,84,140,230,255,255,255,255,1,97,101,219,255,255,255,255,1,26,58,125,239,255,255,255,1,22,179,198,255,255,255,255,1,16,175,192,234,255,255,255,1,71,120,146,165,255,255,255,1,71,77,100,209,255,255,255,1,71,119,187,255,255,255,255,1,94,183,189,255,255,255,255,1,42,120,141,192,255,255,255,1,14,15,16,21,94,255,255,1,71,141,192,220,255,255,255,1,56,71,147,179,233,255,255,1,9,18,71,186,255,255,255,1,49,71,128,255,255,255,255,1,15,21,52,79,171,255,255,1,25,60,112,255,255,255,255,1,193,255,255,255,255,255,255,1,32,118,235,255,255,255,255,1,36,80,191,255,255,255,255,1,3,122,255,255,255,255,255,1,71,142,209,239,255,255,255,1,24,57,169,172,186,255,255,1,33,94,147,195,230,233,255,1,87,142,146,255,255,255,255,1,76,171,217,223,255,255,255,1,79,87,143,224,255,255,255,1,98,118,218,255,255,255,255,1,36,149,192,255,255,255,255,1,190,206,234,244,255,255,255,1,86,122,255,255,255,255,255,1,197,236,255,255,255,255,255,1,48,235,255,255,255,255,255,1,8,249,255,255,255,255,255,1,196,236,255,255,255,255,255,1,53,255,255,255,255,255,255,1,70,73,149,229,255,255,255,1,5,12,71,209,225,255,255,1,73,94,98,113,167,255,255,1,11,43,100,168,255,255,255,1,61,104,167,183,244,255,255,1,9,106,215,236,255,255,255,1,10,48,236,255,255,255,255,1,36,71,77,95,209,255,255,1,35,48,131,156,226,234,255,1,74,147,238,255,255,255,255,1,94,141,189,248,255,255,255,1,140,255,255,255,255,255,255,1,63,143,255,255,255,255,255,1,71,112,116,212,255,255,255,1,68,236,255,255,255,255,255,1,160,163,255,255,255,255,255,1,226,240,255,255,255,255,255,1,75,179,235,255,255,255,255,1,36,120,255,255,255,255,255,1,15,57,147,228,255,255,255,1,25,28,84,92,147,255,255,1,10,64,146,228,245,255,255,1,52,58,63,68,214,255,255,1,102,118,129,138,190,255,255,1,127,212,255,255,255,255,255,1,29,187,255,255,255,255,255,1,210,255,255,255,255,255,255,1,53,66,141,187,241,255,255,1,165,207,246,255,255,255,255,1,63,196,217,255,255,255,255,1,182,187,255,255,255,255,255,1,17,51,206,229,244,255,255,1,165,191,193,235,255,255,255,1,77,255,255,255,255,255,255,1,71,210,255,255,255,255,255,1,52,57,77,205,255,255,255,1,117,186,255,255,255,255,255,1,164,167,204,214,255,255,255,1,77,141,157,194,255,255,255,1,74,170,173,191,234,255,255,1,72,196,238,255,255,255,255,1,120,255,255,255,255,255,255,1,153,247,255,255,255,255,255,1,15,103,160,186,240,248,255,1,146,255,255,255,255,255,255,1,115,123,133,236,255,255,255,1,63,94,96,164,255,255,255,1,70,170,255,255,255,255,255,1,36,117,195,222,255,255,255,1,32,215,255,255,255,255,255,1,210,211,255,255,255,255,255,1,50,82,86,108,164,255,255,1,136,147,169,199,255,255,255,1,137,145,153,175,255,255,255,1,9,48,157,255,255,255,255,1,123,151,219,255,255,255,255,1,207,229,255,255,255,255,255,1,137,193,255,255,255,255,255,1,27,73,171,255,255,255,255,1,17,198,255,255,255,255,255,1,42,143,156,255,255,255,255,1,36,38,255,255,255,255,255,1,26,108,141,255,255,255,255,1,189,255,255,255,255,255,255,1,68,86,214,233,255,255,255,1,121,206,255,255,255,255,255,1,9,18,20,23,29,67,255,1,76,107,198,244,255,255,255,1,65,73,216,255,255,255,255,1,11,103,194,249,255,255,255,1,148,232,234,255,255,255,255,1,125,158,242,255,255,255,255,1,122,182,210,214,233,251,255,1,27,64,89,160,164,224,255,1,52,123,214,255,255,255,255,1,42,145,193,233,255,255,255,1,30,45,68,80,132,197,255,1,16,173,236,255,255,255,255,1,11,166,212,229,255,255,255,1,34,94,255,255,255,255,255,1,206,255,255,255,255,255,255,1,120,252,255,255,255,255,255,1,134,210,218,221,255,255,255,1,72,81,166,233,255,255,255,1,97,115,255,255,255,255,255,1,137,144,221,240,255,255,255,1,104,215,216,240,255,255,255,1,16,39,153,165,169,206,255,1,45,197,255,255,255,255,255,1,45,64,73,210,255,255,255,1,135,206,255,255,255,255,255,1,61,156,185,210,213,255,255,1,189,215,229,238,253,255,255,1,253,255,255,255,255,255,255,1,197,199,252,255,255,255,255,1,255,255,255,255,255,255,255,1,77,196,255,255,255,255,255,1,9,18,20,23,29,67,255,1,125,153,255,255,255,255,255,1,8,140,176,229,255,255,255,1,16,33,86,140,193,237,255,1,37,118,192,251,255,255,255,1,5,255,255,255,255,255,255,1,61,141,172,209,230,255,255,1,16,130,227,255,255,255,255,1,61,67,89,147,232,255,255,1,30,38,101,109,193,255,255,1,161,187,211,255,255,255,255,1,26,219,244,246,255,255,255,1,119,123,129,168,255,255,255,1,104,130,144,216,221,255,255,1,98,101,158,173,255,255,255,1,67,98,104,196,255,255,255,1,78,149,200,227,255,255,255,1,228,229,255,255,255,255,255,1,128,234,255,255,255,255,255,1,88,216,219,234,255,255,255,1,62,144,255,255,255,255,255,1,17,38,243,255,255,255,255,1,67,78,221,255,255,255,255,1,41,134,170,255,255,255,255,1,62,189,255,255,255,255,255,1,123,134,173,240,255,255,255,1,52,84,255,255,255,255,255,1,41,217,234,238,255,255,255,1,214,216,255,255,255,255,255,1,35,99,187,223,255,255,255,1,83,138,213,214,255,255,255,1,45,123,214,255,255,255,255,1,232,234,255,255,255,255,255,1,38,57,61,104,133,189,234,1,147,169,230,233,255,255,255,1,13,15,187,216,255,255,255,1,8,15,54,132,172,255,255,1,9,27,96,186,255,255,255,1,75,153,229,233,255,255,255,1,34,53,95,134,210,255,255,1,83,146,229,255,255,255,255,1,47,155,169,195,229,255,255,1,26,105,181,206,224,245,255,1,16,199,255,255,255,255,255,1,141,151,218,248,255,255,255,1,147,162,172,213,255,255,255,1,122,171,255,255,255,255,255,1,15,31,192,255,255,255,255,1,64,66,101,162,165,255,255,1,61,83,108,183,255,255,255,1,217,255,255,255,255,255,255,1,120,255,255,255,255,255,255,1,111,255,255,255,255,255,255,1,105,107,150,255,255,255,255,1,51,187,251,255,255,255,255,1,14,173,176,236,255,255,255,1,98,139,215,227,255,255,255,1,68,141,145,255,255,255,255,1,79,165,191,206,255,255,255,1,122,164,255,255,255,255,255,1,30,56,101,193,255,255,255,1,19,71,116,128,255,255,255,1,99,107,255,255,255,255,255,1,140,255,255,255,255,255,255,1,100,143,145,187,255,255,255,1,99,141,148,214,255,255,255,1,59,79,255,255,255,255,255,1,66,87,102,106,108,162,255,1,31,88,255,255,255,255,255,1,22,141,240,249,255,255,255,1,118,141,172,191,228,255,255,1,3,103,131,157,234,255,255,1,19,143,172,204,255,255,255,1,31,206,224,255,255,255,255,1,251,255,255,255,255,255,255,1,196,226,232,255,255,255,255,1,75,158,242,255,255,255,255,1,82,89,147,194,255,255,255,1,107,137,146,149,151,255,255,1,11,23,42,104,109,228,255,1,8,146,150,204,206,224,255,1,26,117,233,255,255,255,255,1,15,119,123,191,210,255,255,1,59,238,255,255,255,255,255,1,202,255,255,255,255,255,255,1,107,204,255,255,255,255,255,1,52,61,163,218,234,255,255,1,56,239,255,255,255,255,255,1,234,244,250,255,255,255,255,1,27,123,133,191,255,255,255,1,79,148,188,255,255,255,255,1,120,214,255,255,255,255,255,1,84,130,237,255,255,255,255,1,120,174,210,255,255,255,255,1,251,255,255,255,255,255,255,1,45,48,158,255,255,255,255,1,26,232,255,255,255,255,255,1,32,33,38,79,179,255,255,1,31,57,68,203,233,255,255,1,4,31,82,154,180,185,255,1,191,208,255,255,255,255,255,1,37,60,254,255,255,255,255,1,11,19,126,186,201,255,255,1,16,40,45,49,255,255,255,1,24,63,173,180,220,254,255,1,104,125,191,255,255,255,255,1,194,200,255,255,255,255,255,1,35,227,255,255,255,255,255,1,60,94,187,218,255,255,255,1,42,157,253,255,255,255,255,1,90,189,255,255,255,255,255,1,26,131,178,214,222,254,255,1,108,125,255,255,255,255,255,1,27,252,255,255,255,255,255,1,41,255,255,255,255,255,255,1,29,95,126,157,255,255,255,1,26,115,131,230,255,255,255,1,158,232,234,255,255,255,255,1,41,190,255,255,255,255,255,1,52,191,234,255,255,255,255,1,97,212,216,255,255,255,255,1,174,191,205,212,255,255,255,1,71,102,144,255,255,255,255,1,68,118,204,218,237,255,255,1,147,152,188,192,255,255,255,1,137,217,240,249,255,255,255,1,12,146,162,214,255,255,255,1,11,21,25,166,255,255,255,1,28,141,188,255,255,255,255,1,20,26,60,87,171,183,255,1,9,157,161,187,255,255,255,1,41,89,218,220,255,255,255,1,13,37,41,164,232,255,255,1,105,129,166,213,255,255,255,1,25,53,132,157,255,255,255,1,13,119,137,177,255,255,255,1,214,218,220,246,255,255,255,1,8,29,255,255,255,255,255,1,153,160,230,234,255,255,255,1,34,130,234,255,255,255,255,1,16,101,152,153,255,255,255,1,172,221,255,255,255,255,255,1,41,85,169,206,236,255,255,1,32,52,121,152,212,255,255,1,28,196,255,255,255,255,255,1,84,94,136,255,255,255,255,1,29,255,255,255,255,255,255,1,120,193,255,255,255,255,255,1,127,183,255,255,255,255,255,1,11,255,255,255,255,255,255,1,97,172,215,255,255,255,255,1,139,141,255,255,255,255,255,1,227,237,255,255,255,255,255,1,255,255,255,255,255,255,255,1,94,151,255,255,255,255,255,1,255,255,255,255,255,255,255,1,36,169,255,255,255,255,255,1,104,148,215,230,255,255,255,1,66,255,255,255,255,255,255,1,10,78,163,255,255,255,255,1,5,38,177,186,255,255,255,1,82,193,207,255,255,255,255,1,12,17,173,176,255,255,255,1,6,59,63,65,147,170,255,1,74,151,157,178,232,255,255,1,158,215,255,255,255,255,255,1,15,17,71,105,198,255,255,1,130,148,187,206,255,255,255,1,219,255,255,255,255,255,255,1,59,191,218,255,255,255,255,1,103,222,255,255,255,255,255,1,168,253,255,255,255,255,255,1,34,57,83,147,195,246,255,1,30,141,184,202,255,255,255,1,80,100,255,255,255,255,255,1,37,49,51,255,255,255,255,1,38,158,255,255,255,255,255,1,35,96,231,255,255,255,255,1,136,255,255,255,255,255,255,1,124,163,255,255,255,255,255,1,15,164,255,255,255,255,255,1,72,230,255,255,255,255,255,1,127,255,255,255,255,255,255,1,80,94,145,164,233,255,255,1,96,117,255,255,255,255,255,1,69,94,173,193,255,255,255,1,42,127,160,166,239,255,255,1,36,99,192,210,255,255,255,1,76,227,240,255,255,255,255,1,74,255,255,255,255,255,255,1,165,210,241,255,255,255,255,1,160,186,255,255,255,255,255,1,9,12,165,211,255,255,255,1,77,104,130,243,255,255,255,1,11,112,253,255,255,255,255,1,4,19,37,100,249,255,255,1,164,240,255,255,255,255,255,1,14,71,135,199,255,255,255,1,55,206,217,230,254,255,255,1,115,224,254,255,255,255,255,1,6,171,180,215,254,255,255,1,110,146,168,255,255,255,255,1,136,166,180,224,255,255,255,1,245,255,255,255,255,255,255,1,38,42,44,162,196,255,255,1,148,255,255,255,255,255,255,1,74,255,255,255,255,255,255,1,15,141,147,248,255,255,255,1,37,70,162,167,255,255,255,1,168,255,255,255,255,255,255,1,216,255,255,255,255,255,255,1,26,232,239,255,255,255,255,1,12,25,50,149,255,255,255,1,28,61,173,207,209,255,255,1,115,192,255,255,255,255,255,1,70,99,123,143,255,255,255,1,71,91,142,147,170,206,255,1,13,66,71,178,255,255,255,1,50,79,86,188,255,255,255,1,57,141,172,198,255,255,255,1,110,157,165,234,255,255,255,1,55,132,228,230,255,255,255,1,94,148,255,255,255,255,255,1,51,117,145,216,255,255,255,1,16,144,255,255,255,255,255,1,117,186,255,255,255,255,255,1,76,107,198,244,255,255,255,1,3,33,81,95,255,255,255,1,229,230,255,255,255,255,255,1,28,46,118,148,223,228,255,1,9,37,125,130,255,255,255,1,35,99,116,219,255,255,255,1,24,69,129,153,230,255,255,1,106,204,218,255,255,255,255,1,8,51,76,219,223,255,255,1,57,111,157,176,229,255,255,1,85,87,136,239,255,255,255,1,16,35,108,175,183,255,255,1,16,255,255,255,255,255,255,1,153,165,209,255,255,255,255,1,82,165,218,220,255,255,255,1,172,188,255,255,255,255,255,1,245,255,255,255,255,255,255,1,9,73,218,255,255,255,255,1,129,255,255,255,255,255,255,1,5,36,83,108,180,201,255,1,71,105,233,255,255,255,255,1,10,149,164,214,255,255,255,1,12,17,86,209,232,255,255,1,32,54,191,255,255,255,255,1,122,210,239,255,255,255,255,1,87,204,240,255,255,255,255,1,212,214,255,255,255,255,255,1,15,24,231,255,255,255,255,1,36,95,209,229,255,255,255,1,81,125,152,153,163,255,255,1,61,74,77,78,221,231,255,1,10,42,83,87,108,255,255,1,119,141,167,201,208,255,255,1,14,78,110,212,213,255,255,1,55,168,173,182,247,255,255,1,27,45,96,151,252,255,255,1,37,106,147,196,222,255,255,1,19,32,41,62,87,115,122,1,38,96,147,163,255,255,255,1,91,134,136,173,255,255,255,1,56,66,138,255,255,255,255,1,99,172,178,255,255,255,255,1,214,221,227,255,255,255,255,1,5,129,141,169,201,255,255,1,49,106,255,255,255,255,255,1,68,212,218,255,255,255,255,1,70,121,182,255,255,255,255,1,178,190,255,255,255,255,255,1,11,19,178,223,255,255,255,1,38,104,179,255,255,255,255,1,131,187,255,255,255,255,255,1,20,34,43,93,191,255,255,1,78,87,109,149,156,255,255,1,4,15,111,151,205,255,255,1,32,59,75,191,255,255,255,1,28,97,179,255,255,255,255,1,15,17,24,64,173,255,255,1,12,68,77,104,210,255,255,1,12,121,146,168,209,228,255,1,12,19,32,107,255,255,255,1,28,127,211,255,255,255,255,1,15,73,78,173,178,196,255,1,18,145,231,255,255,255,255,1,38,82,99,159,174,207,255,1,71,210,255,255,255,255,255,1,66,67,115,131,255,255,255,1,15,87,178,185,255,255,255,1,76,158,176,230,240,255,255,1,7,16,44,116,217,255,255,1,40,76,132,135,139,147,255,1,49,57,61,203,245,255,255,1,81,192,255,255,255,255,255,1,22,102,135,155,159,255,255,1,64,72,109,149,252,255,255,1,5,36,100,132,147,186,255,1,5,74,108,255,255,255,255,1,221,255,255,255,255,255,255,1,123,167,228,255,255,255,255,1,15,97,234,255,255,255,255,1,70,109,145,220,255,255,255,1,66,104,173,229,255,255,255,1,51,107,159,163,177,255,255,1,10,158,255,255,255,255,255,1,25,79,106,175,189,255,255,1,3,50,53,71,255,255,255,1,3,30,71,78,187,255,255,1,28,48,59,209,255,255,255,1,62,189,255,255,255,255,255,1,4,87,107,109,224,255,255,1,30,102,107,223,255,255,255,1,13,100,165,218,232,252,255,1,11,151,186,189,240,247,255,1,38,77,111,163,164,167,255,1,29,48,78,115,167,214,255,1,53,68,204,222,255,255,255,1,9,17,232,238,255,255,255,1,27,253,255,255,255,255,255,1,1,103,125,236,243,255,255,255,1,34,127,156,225,255,255,255,1,29,241,245,255,255,255,255,1,17,59,116,128,156,255,255,1,57,108,115,192,255,255,255,1,165,233,255,255,255,255,255,1,9,199,236,246,247,255,255,1,104,116,153,255,255,255,255,1,5,75,104,132,168,219,255,1,143,173,219,248,255,255,255,1,108,149,255,255,255,255,255,1,3,57,213,255,255,255,255,1,72,233,255,255,255,255,255,1,30,255,255,255,255,255,255,1,89,133,147,222,236,255,255,1,109,115,131,187,250,255,255,1,77,82,125,255,255,255,255,1,119,255,255,255,255,255,255,1,8,38,71,138,232,255,255,1,61,77,96,151,164,187,255,1,44,108,155,251,255,255,255,1,128,137,147,255,255,255,255,1,16,27,66,76,106,109,255,1,21,112,113,255,255,255,255,1,34,191,196,214,251,255,255,1,12,51,143,148,255,255,255,1,5,11,71,145,234,255,255,1,84,204,240,255,255,255,255,1,25,140,255,255,255,255,255,1,42,43,50,159,255,255,255,1,57,84,153,170,205,255,255,1,8,43,48,131,144,255,255,1,72,163,222,232,234,255,255,1,49,131,153,232,255,255,255,1,96,167,255,255,255,255,255,1,76,235,255,255,255,255,255,1,9,189,213,233,255,255,255,1,18,43,46,102,115,163,255,1,5,30,80,104,137,206,255,1,80,95,163,181,226,244,255,1,108,120,127,147,172,176,187,1,128,135,151,255,255,255,255,1,5,12,122,170,255,255,255,1,169,216,241,255,255,255,255,1,106,109,134,148,152,255,255,1,56,71,152,187,208,255,255,1,118,151,193,255,255,255,255,1,64,71,73,255,255,255,255,1,71,89,204,255,255,255,255,1,94,233,235,255,255,255,255,1,71,141,249,255,255,255,255,1,71,74,124,158,255,255,255,1,107,243,255,255,255,255,255,1,122,255,255,255,255,255,255,1,6,44,91,115,193,255,255,1,62,131,201,255,255,255,255,1,72,215,218,234,255,255,255,1,60,136,253,255,255,255,255,1,123,191,230,255,255,255,255,1,64,107,111,204,230,236,255,1,28,146,163,240,255,255,255,1,15,29,34,71,178,213,233,1,60,64,95,171,255,255,255,1,187,245,255,255,255,255,255,1,12,17,53,134,229,255,255,1,68,167,203,255,255,255,255,1,22,58,108,182,204,255,255,1,96,222,255,255,255,255,255,1,234,240,255,255,255,255,255,1,165,234,236,239,255,255,255,1,5,12,78,87,145,252,255,1,35,57,64,91,239,255,255,1,89,153,225,234,255,255,255,1,36,152,178,242,255,255,255,1,35,181,213,255,255,255,255,1,37,90,105,121,255,255,255,1,32,56,115,255,255,255,255,1,5,48,138,185,255,255,255,1,149,247,252,255,255,255,255,1,35,162,197,206,214,225,255,1,250,255,255,255,255,255,255,1,45,250,255,255,255,255,255,1,94,216,232,255,255,255,255,1,28,94,190,255,255,255,255,1,100,144,243,255,255,255,255,1,117,143,215,255,255,255,255,1,26,54,121,255,255,255,255,1,255,255,255,255,255,255,255,1,105,127,255,255,255,255,255,1,18,96,139,225,242,255,255,1,74,214,221,230,255,255,255,1,113,131,168,255,255,255,255,1,9,94,214,255,255,255,255,1,25,106,160,188,255,255,255,1,22,71,123,214,255,255,255,1,10,30,71,171,209,255,255,1,13,30,71,170,255,255,255,1,15,71,74,147,186,250,255,1,71,209,239,255,255,255,255,1,94,234,255,255,255,255,255,1,73,94,122,231,255,255,255,1,124,255,255,255,255,255,255,1,30,103,135,164,255,255,255,1,54,170,255,255,255,255,255,1,9,38,115,135,151,193,255,1,8,15,27,92,191,255,255,1,17,41,56,85,255,255,255,1,30,48,86,221,240,255,255,1,25,28,166,183,255,255,255,1,4,96,255,255,255,255,255,1,26,166,173,174,255,255,255,1,21,82,129,254,255,255,255,1,56,108,150,190,206,255,255,1,36,92,95,111,188,255,255,1,94,99,106,219,255,255,255,1,29,71,192,209,255,255,255,1,26,71,255,255,255,255,255,1,134,191,216,255,255,255,255,1,59,121,145,255,255,255,255,1,14,18,189,193,255,255,255,1,123,190,255,255,255,255,255,1,4,17,119,214,255,255,255,1,55,140,152,247,255,255,255,1,10,78,230,232,255,255,255,1,30,48,193,255,255,255,255,1,148,156,232,255,255,255,255,1,16,27,105,198,255,255,255,1,108,193,233,240,255,255,255,1,187,255,255,255,255,255,255,1,135,164,230,255,255,255,255,1,15,48,147,164,168,255,255,1,71,210,255,255,255,255,255,1,12,222,255,255,255,255,255,1,10,74,124,127,230,255,255,1,3,52,180,187,240,255,255,1,45,105,172,196,206,255,255,1,27,92,222,255,255,255,255,1,78,212,215,232,255,255,255,1,38,176,180,255,255,255,255,1,14,187,199,255,255,255,255,1,116,168,212,255,255,255,255,1,77,94,105,255,255,255,255,1,3,71,232,255,255,255,255,1,97,191,236,255,255,255,255,1,255,255,255,255,255,255,255,1,71,100,138,255,255,255,255,1,9,71,141,186,255,255,255,1,94,183,190,255,255,255,255,1,38,213,255,255,255,255,255,1,50,116,234,243,255,255,255,1,141,255,255,255,255,255,255,1,48,57,255,255,255,255,255,1,28,48,255,255,255,255,255,1,71,237,255,255,255,255,255,1,30,237,255,255,255,255,255,1,255,255,255,255,255,255,255,1,9,107,163,255,255,255,255,1,43,166,255,255,255,255,255,1,26,152,232,255,255,255,255,1,8,255,255,255,255,255,255,1,26,131,141,170,171,217,255,1,51,104,214,228,239,255,255,1,25,99,233,240,255,255,255,1,25,34,57,167,255,255,255,1,48,119,165,255,255,255,255,1,48,49,99,147,254,255,255,1,38,101,153,181,229,250,255,1,58,72,77,98,148,255,255,1,13,75,90,145,238,255,255,1,3,81,200,234,255,255,255,1,66,115,174,191,222,255,255,1,27,71,82,143,152,187,255,1,153,160,162,255,255,255,255,1,71,120,255,255,255,255,255,1,48,128,255,255,255,255,255,1,25,57,209,223,255,255,255,1,27,94,255,255,255,255,255,1,120,140,255,255,255,255,255,1,28,96,255,255,255,255,255,1,236,255,255,255,255,255,255,1,3,48,108,232,255,255,255,1,43,71,255,255,255,255,255,1,13,255,255,255,255,255,255,1,36,255,255,255,255,255,255,1,198,237,255,255,255,255,255,1,14,140,159,233,255,255,255,1,5,17,29,72,255,255,255,1,255,255,255,255,255,255,255,1,139,233,249,255,255,255,255,1,70,141,189,252,255,255,255,1,53,68,204,222,255,255,255,1,55,108,123,239,255,255,255,1,124,146,219,255,255,255,255,1,152,168,248,255,255,255,255,1,122,190,233,255,255,255,255,1,167,168,213,255,255,255,255,1,80,117,210,255,255,255,255,1,74,81,173,186,218,220,255,1,30,85,230,249,255,255,255,1,73,79,106,213,221,222,255,1,72,134,255,255,255,255,255,1,112,176,180,203,225,255,255,1,41,131,132,181,197,255,255,1,37,173,176,239,248,255,255,1,12,152,255,255,255,255,255,1,206,238,255,255,255,255,255,1,117,255,255,255,255,255,255,1,94,95,213,255,255,255,255,1,94,255,255,255,255,255,255,1,71,188,255,255,255,255,255,1,73,255,255,255,255,255,255,1,25,236,255,255,255,255,255,1,96,252,255,255,255,255,255,1,117,147,188,255,255,255,255,1,143,203,255,255,255,255,255,1,26,118,232,255,255,255,255,1,48,204,255,255,255,255,255,1,100,121,255,255,255,255,255,1,51,255,255,255,255,255,255,1,94,206,253,255,255,255,255,1,243,255,255,255,255,255,255,1,80,196,255,255,255,255,255,1,71,210,255,255,255,255,255,1,118,122,162,191,221,255,255,1,35,131,134,158,248,255,255,1,140,194,229,245,255,255,255,1,97,118,168,255,255,255,255,1,68,70,147,233,237,255,255,1,52,153,240,255,255,255,255,1,37,69,122,210,255,255,255,1,76,151,177,224,255,255,255,1,38,88,197,234,255,255,255,1,32,153,255,255,255,255,255,1,26,35,50,255,255,255,255,1,52,101,122,147,178,255,255,1,115,122,137,172,255,255,255,1,117,219,255,255,255,255,255,1,104,134,145,216,255,255,255,1,27,126,146,186,255,255,255,1,134,145,219,255,255,255,255,1,104,140,236,255,255,255,255,1,32,209,255,255,255,255,255,1,62,107,151,210,255,255,255,1,95,141,189,255,255,255,255,1,71,255,255,255,255,255,255,1,253,255,255,255,255,255,255,1,101,121,255,255,255,255,255,1,255,255,255,255,255,255,255,1,181,211,255,255,255,255,255,1,102,146,165,255,255,255,255,1,6,131,248,255,255,255,255,1,8,84,187,230,255,255,255,1,144,152,255,255,255,255,255,1,255,255,255,255,255,255,255,1,8,145,159,170,187,236,255,1,141,153,186,255,255,255,255,1,62,116,124,142,255,255,255,1,117,145,255,255,255,255,255,1,22,26,54,144,202,255,255,1,27,94,165,230,255,255,255,1,6,14,165,218,255,255,255,1,70,107,228,255,255,255,255,1,48,147,168,227,251,255,255,1,57,187,255,255,255,255,255,1,52,218,243,255,255,255,255,1,52,234,255,255,255,255,255,1,42,122,154,255,255,255,255,1,11,19,50,142,255,255,255,1,7,132,187,224,255,255,255,1,213,216,255,255,255,255,255,1,13,15,27,96,232,255,255,1,116,215,255,255,255,255,255,1,29,125,255,255,255,255,255,1,118,170,238,252,255,255,255,1,52,107,121,255,255,255,255,1,30,71,189,255,255,255,255,1,163,233,255,255,255,255,255,1,27,87,213,255,255,255,255,1,29,71,143,209,255,255,255,1,52,57,77,205,255,255,255,1,117,173,176,180,183,255,255,1,4,14,15,99,121,255,255,1,77,112,227,229,255,255,255,1,12,43,255,255,255,255,255,1,122,214,217,233,255,255,255,1,127,193,198,255,255,255,255,1,27,32,76,154,255,255,255,1,12,45,66,209,255,255,255,1,1,255,255,255,255,255,255,255,1,77,203,218,255,255,255,255,1,73,234,238,255,255,255,255,1,27,56,79,147,213,255,255,1,54,255,255,255,255,255,255,1,4,197,215,255,255,255,255,1,29,255,255,255,255,255,255,1,100,141,255,255,255,255,255,1,253,255,255,255,255,255,255,1,32,154,251,255,255,255,255,1,104,119,229,252,255,255,255,1,26,232,255,255,255,255,255,1,29,214,234,255,255,255,255,1,144,209,255,255,255,255,255,1,213,215,255,255,255,255,255,1,146,255,255,255,255,255,255,1,121,143,248,255,255,255,255,1,94,142,187,192,203,255,255,1,9,28,94,107,182,255,255,1,28,141,188,255,255,255,255,1,255,255,255,255,255,255,255,1,126,193,212,255,255,255,255,1,3,12,17,71,255,255,255,1,42,55,179,222,233,255,255,1,3,72,77,201,230,255,255,1,55,82,151,172,179,250,255,1,87,130,141,255,255,255,255];
    plotFlag = 0;
%     for i = 1:2:length(varagin)   
%         if(strcmp(varagin(i),'plot'))
%              plotFlag = varagin(i+1); 
%         end
%     end
    vector=vector';
    if isa(vector,'empty')
        error('no input!');
    elseif(size(vector,2)==1)
        vector=vector';
    end
    template = unique(vector);
    totalNum = length(template);
    temp = cell(1,totalNum);
    for i = 1:totalNum
        num = length(find(vector == template(i)));
        temp{i}=[template(i),num];
    end
    if(plotFlag == 1)
        BW = ceil( ( template(end)-template(1) )/20 );
        if(BW > 1)
            histogram(vector,'BinWidth',BW,'Normalization','probability');
        else
            histogram(vector,'Normalization','probability');
        end
    end
end

