function patch = ahrensLoader(patchSz,xyzRng,tRng,dataPath)

patch = zeros([cellfun(@(x)diff(x)+1,xyzRng),diff(tRng)+1]);
nImg = (diff(tRng)+1)*(diff(xyzRng{3})+1);
fprintf('Loading %d images\n',nImg)
for it=1:diff(tRng)+1
  for iz=1:diff(xyzRng{3})+1
    tmp = imread(fullfile(dataPath,...
  	       ['/dff_aligned/dff_aligned_T' num2str(tRng(1)+it-1) '_slice' num2str(xyzRng{3}(1)+iz-1) '.jp2']),...
          'PixelRegion',xyzRng(1:2));
  	 patch(1:diff(xyzRng{1})+1,1:diff(xyzRng{2})+1,iz,it) = (double(tmp) - 15000)/5000;
  end
  fprintf('t=%d\n',it)
end