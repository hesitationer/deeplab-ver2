% save jpg images as bin file for cpp
%
is_server = 1;

dataset = 'high_brown';  %'coco', 'voc2012', 'high_brown'

if is_server
  if strcmp(dataset, 'voc2012')
    img_folder  = '../../../rmt/data/pascal/VOCdevkit/VOC2012/JPEGImages';
    save_folder = '../../../rmt/data/pascal/VOCdevkit/VOC2012/PPMImages';
  elseif strcmp(dataset, 'coco')
    img_folder  = '../../../rmt/data/coco/JPEGImages';
    save_folder = '../../../rmt/data/coco/PPMImages';
  elseif strcmp(dataset, 'high_brown')
    img_folder  = '../../../rmt/data/high_brown/JPEGImages';
    save_folder = '../../../rmt/data/high_brown/PPMImages';
  end
else
  img_folder = '../img';
  save_folder = '../img_ppm';
end

if ~exist(save_folder, 'dir')
    mkdir(save_folder);
end

img_dir = dir(fullfile(img_folder, '*.jpg'));

for i = 1 : numel(img_dir)
    fprintf(1, 'processing %d (%d)...\n', i, numel(img_dir));
    img = imread(fullfile(img_folder, img_dir(i).name));
    
    img_fn = img_dir(i).name(1:end-4);
    save_fn = fullfile(save_folder, [img_fn, '.ppm']);
    
    imwrite(img, save_fn);   
end
    
