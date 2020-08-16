function [] = load_bus(root_path)

cur_wd = pwd;
cd(fullfile(root_path, 'bus'))

bus_file_list = ls('*.m');
[r,c] = size(bus_file_list);
for i = 1:r
    name = bus_file_list(i,:);
    name = name(~isspace(name)); 
    disp(['load ', name, ' ...'])
    run(name); 
end

cd(cur_wd);

end

