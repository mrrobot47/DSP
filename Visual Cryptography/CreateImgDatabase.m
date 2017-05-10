function [ListOfImageNames] = CreateImgDatabase()
folder = 'C:\Users\kr2m\Google Drive\DSP Prj\db\db\*.*';
ListOfImageNames = {};
ImageFiles = dir(folder);
    for Index = 1:length(ImageFiles)
        baseFileName = ImageFiles(Index).name;
        [folder, name, extension] = fileparts(baseFileName);
        extension = upper(extension);
        % Let's save just those we are interested in:
        switch lower(extension)
        case {'.tif'}
            % Allow only PNG, TIF, JPG, or BMP images
            ListOfImageNames = [ListOfImageNames baseFileName];
        otherwise
        end
    end
    ListOfImageNames = sort_nat(ListOfImageNames);
end