function Property = getRegionProps(BW,PropertyName)
    s = regionprops(BW,PropertyName,'Area');
    if length(s) > 1
        %More than 1 binary regions in image
        areas = cat(1,s.Area);
        [~,I] = max(areas);
        s = s(I);
    end
    if isempty(s) %no binary region in image, no number present
        %disp('no regions props')
        Property = NaN; %return NaN
    else
        eval(strcat('Property = s(1).',PropertyName,';'))
    end
end