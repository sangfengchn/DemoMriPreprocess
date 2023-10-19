% load atlas data
atlasNii = spm_vol('wBN_Atlas_246_2mm.nii');
atlasMat = spm_read_vols(atlasNii);

% load subject's gm data
subNii = spm_vol('mri/p1t1w.nii');
subMat = spm_read_vols(subNii);

% get gm volume of each regions
numRegions = 246;
subRoiVol = zeros(numRegions, 1);
% the resolution is 1mm*1mm*1mm, so the volume of each voxel is 1mm3
volEachVoxel = 1 * 1 * 1;
for i = 1:numRegions
    subRoiVol(i) = sum(subMat(atlasMat == i)) * volEachVoxel;
end

% subRoiVol is volume of each regions, and the unit is mm3.