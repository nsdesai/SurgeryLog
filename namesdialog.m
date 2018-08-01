function names = namesdialog(names)
global nameToAdd idxToDelete

names = names(1:end-1);
nameToAdd = [];
idxToDelete = [];

d = dialog('Position',[300 300 250 200],'Name','Add or Delete');

txt = uicontrol('Parent',d,...
    'Style','text',...
    'Position',[20 130 210 40],...
    'String','Name to delete'); %#ok<*NASGU>

popup = uicontrol('Parent',d,...
    'Style','popup',...
    'Position',[50 125 150 25],...
    'String',['None', names],...
    'Callback',@popup_callback);

txt1 = uicontrol('Parent',d,...
    'Style','text',...
    'Position',[20 65 210 40],...
    'String','Name to add'); %#ok<*NASGU>

edit1 = uicontrol('Parent',d,...
    'Style','edit',...
    'Position',[50 60 150 25],...
    'String','Mouse, Mickey',...
    'Callback',@edit1_callback);

btn = uicontrol('Parent',d,...
    'Position',[89 20 70 25],...
    'String','Close',...
    'Callback','delete(gcf)');

uiwait(d);

names(idxToDelete) = [];
names = [names, nameToAdd];
names = [sort(unique(names)),'Add / Delete'];



function popup_callback(popup,~)
global idxToDelete
idx = popup.Value;
if idx == 1
    idxToDelete = [];
else
    idxToDelete = idx-1;
end



function edit1_callback(edit1,~)
global nameToAdd
newName = edit1.String;
if strncmp(newName,'Mouse',5) || length(newName)<4 || ~contains(newName,',')
    nameToAdd = [];
else
    nameToAdd = newName;
end
