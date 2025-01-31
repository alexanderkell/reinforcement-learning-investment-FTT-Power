
%Copyright 2015 Jean-Francois Mercure, jm801@cam.ac.uk
%This program is distributed under the Lesser GNU General Public License (LGPL)
%This file is part of FTT61x24v8.

% FTT61x24v8 is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% FTT61x24v8 is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with FTT61x24v8.  If not, see <http://www.gnu.org/licenses/>.

function varargout = FTT61x24v8Gui(varargin)
% FTT61X24V8GUI MATLAB code for FTT61x24v8Gui.fig
%      FTT61X24V8GUI, by itself, creates a new FTT61X24V8GUI or raises the existing
%      singleton*.
%
%      H = FTT61X24V8GUI returns the handle to a new FTT61X24V8GUI or the handle to
%      the existing singleton*.
%
%      FTT61X24V8GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FTT61X24V8GUI.M with the given input arguments.
%
%      FTT61X24V8GUI('Property','Value',...) creates a new FTT61X24V8GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FTT61x24v8Gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FTT61x24v8Gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FTT61x24v8Gui

% Last Modified by GUIDE v2.5 21-May-2019 13:05:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FTT61x24v8Gui_OpeningFcn, ...
                   'gui_OutputFcn',  @FTT61x24v8Gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before FTT61x24v8Gui is made visible.
function FTT61x24v8Gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FTT61x24v8Gui (see VARARGIN)

% Choose default command line output for FTT61x24v8Gui
handles.output = hObject;

handles.RegStr = {'1 Belgium','2 Denmark','3 Germany','4 Greece','5 Spain','6 France','7 Ireland','8 Italy','9 Luxembourg','10 Netherlands','11 Austria','12 Portugal','13 Finland','14 Sweden','15 UK','16 Czech Republic','17 Estonia','18 Cyprus','19 Latvia','20 Lithuania','21 Hungary','22 Malta','23 Poland','24 Slovenia','25 Slovakia','26 Bulgaria','27 Romania','28 Norway','29 Switzerland','30 Iceland','31 Croatia','32 Turkey','33 Macedonia','34 USA','35 Japan','36 Canada','37 Australia','38 New Zealand','39 Russian Federation','40 Rest of Annex I','41 China','42 India','43 Mexico','44 Brazil','45 Argentina','46 Colombia','47 Rest of Latin America','48 Korea','49 Taiwan','50 Indonesia','51 Rest of ASEAN','52 OPEC excl Venezuela','53 Rest of world','54 Ukraine','55 Saudi Arabia','56 Nigeria','57 South Africa','58 Rest of Africa','59 Africa OPEC','60 Malaysia','61 Kazakhstan'};
set(handles.RegListBox,'string',handles.RegStr);
handles.TechStr = {'1- Nuclear','2- Oil','3- Coal','4- Coal + CCS','5- IGCC','6- IGCC + CCS','7- CCGT','8- CCGT + CCS','9- Solid Biomass','10- S Biomass CCS','11- BIGCC','12- BIGCC + CCS','13- Biogas','14- Biogas + CCS','15- Tidal','16- Large Hydro','17- Onshore','18- Offshore','19- Solar PV','20- CSP','21- Geothermal','22- Wave','23- Fuel Cells','24- CHP'};
set(handles.TechListBox,'string',handles.TechStr);
handles.RegStrAgg = {'1 Europe','2 N. America','3 S. America','4 Cnt Asia','5 East Asia','6 ROW'};
handles.TechStrAgg = {'1 Petrol','2 Adv Petrol','3 Diesel','4 Adv Diesel','5 CNG','6 Hybrid','7 Electric','8 2W','9 Adv 2W'};
handles.FuelStr = {'1- Uranium','2- Oil','3- Coal','4- Gas','5- Biofuels','6- Electricity'};
handles.LBStr = {'1- Base Load','2- Lower mid-load','3- Upper mid-load','4- Peak','5- Residual peak','6- Var renewables'};

if ispc
    s = '\';
else
    s = '/';
end
if exist(strcat(trim3(mfilename('fullpath'),s),'/FTT61x24v8filenames.mat'),'file')
    P = load(strcat(trim3(mfilename('fullpath'),s),'/FTT61x24v8filenames.mat'));
    handles.Path = P.WinPath;
    set(handles.PathField,'string', handles.Path);
    set(handles.CostsEdit,'string',P.AssumptionsFileName);
    set(handles.HistoricalEdit,'string',P.HistoricalFileName);
    set(handles.CSCDataEdit,'string',P.CSCDataFileName);
    set(handles.SaveFileEdit,'string',P.ScenarioSaveFileName);
    set(handles.EndEdit,'string',num2str(P.EndYear));
    set(handles.dtEdit,'string',num2str(P.dt));
else
    handles.Path = pwd;
end
handles.ScenariosEmpty = 1;
handles.Slots(1) = handles.Slot0;
handles.Slots(2) = handles.Slot1;
handles.Slots(3) = handles.Slot2;
handles.Slots(4) = handles.Slot3;
handles.Slots(5) = handles.Slot4;
handles.Slots(6) = handles.Slot5;
handles.Slots(7) = handles.Slot6;
handles.Slots(8) = handles.Slot7;
handles.Slots(9) = handles.Slot8;
handles.Slots(10) = handles.Slot9;
handles.NWR = 61;
handles.NET = 24;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FTT61x24v8Gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FTT61x24v8Gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%===============================================================================
%==========Useful Code Here!!!==================================================
%===============================================================================

function ChooseExcelFile_Callback(hObject, eventdata, handles)
[NFile,NPath] = uigetfile(strcat(handles.Path,'.\*.*'),'Choose an Excel file');
if ~(sum(NPath) == 0)
    set(handles.PathField,'string', NPath);
    set(handles.CostsEdit,'string', NFile);
    handles.Path = NPath;
    SaveFields(handles);
end
guidata(hObject, handles);

function ChooseHistorical_Callback(hObject, eventdata, handles)
[NFile,NPath] = uigetfile(strcat(handles.Path,'\*.*'),'Choose an Excel file');
if ~(sum(NPath) == 0)
    set(handles.PathField,'string', NPath);
    set(handles.HistoricalEdit,'string', NFile);
    handles.Path = NPath;
    SaveFields(handles);
end
guidata(hObject, handles);


function ChooseCSCtxt_Callback(hObject, eventdata, handles)
[NFile,NPath] = uigetfile(strcat(handles.Path,'\*.*'),'Choose an text file');
if ~(sum(NPath) == 0)
    set(handles.PathField,'string', NPath);
    set(handles.CSCDataEdit,'string', NFile);
    handles.Path = NPath;
    SaveFields(handles);
end
guidata(hObject, handles);

function ChooseSaveFile_Callback(hObject, eventdata, handles)
[NFile,NPath] = uigetfile(strcat(handles.Path,'\*.*'),'Choose an matlab file');
if ~(sum(NPath) == 0)
    set(handles.PathField,'string', NPath);
    set(handles.SaveFileEdit,'string', NFile);
    handles.Path = NPath;
    SaveFields(handles);
end
guidata(hObject, handles);

function ChooseExportFile_Callback(hObject, eventdata, handles)
[NFile,NPath] = uigetfile(strcat(handles.Path,'\*.*'),'Choose an matlab file');
if ~(sum(NPath) == 0)
    set(handles.PathField,'string', NPath);
    set(handles.ExportFileEdit,'string', NFile);
    handles.Path = NPath;
    SaveFields(handles);
end
guidata(hObject, handles);

function LoadScenarios_Callback(hObject, eventdata, handles)
%---Function that loads scenario files and identifies calculated scenarios
%cd(get(handles.PathField,'string'));
SaveFileName = get(handles.SaveFileEdit,'string');
handles.Path = get(handles.PathField,'string');

%Find existing scenarios in Common Data Format Files
%Filenames = ls(strcat(handles.Path,trim3(SaveFileName,'.'),'*.cdf'));
Filenames = dir(strcat(handles.Path,trim3(SaveFileName,'.'),'*.cdf'));
%Scenario numbers
j = 1;
k = '';
for i = 1:size(Filenames,1)
    %Find entries with the file name in it
    v(i) = strfind(Filenames(i).name,trim3(SaveFileName,'.'))+length(trim3(SaveFileName,'.'));
    %Narrow down to exact filenames to extract filenumbers
    if ~isempty(str2num(Filenames(i).name(v(i):v(i)+1)))
        k(j) = str2num(Filenames(i).name(v(i):v(i)+1))+1;
        j = j + 1;
    end
end
if isempty(k)
    errordlg('Invalid save path or filename');
    return;
end
for i = k
    handles.Scenario(i) = FTTLoadCDF(strcat(handles.Path,trim3(SaveFileName,'.'),sprintf('%02d',i-1),'.cdf'));
    VarNames = load(strcat(handles.Path,'FTT61x24v8VarNames.mat'));
    handles.Scenario(i).Names = VarNames.VarNames;
    set(handles.Slots(i),'BackgroundColor',[1 0 0]);
end
%Clear scenarios that don't have a file
for i = find(~ismember([1:10],k))
    set(handles.Slots(i),'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
    clear handles.Scenario(i);
end    
handles.ScenariosEmpty = 0;
set(handles.SavedText,'string','Saved','foregroundcolor','r');
%Get list of variables as defined in the output structure of the calculation
k = ScenarioNumber(handles);
VarList = fieldnames(handles.Scenario(k));
%Discard first few ones (t, th)
set(handles.VarListBox,'string',VarList(5:end));
guidata(hObject, handles);

function SaveScenarios_Callback(hObject, eventdata, handles)
%---Function that saves scenarios in a .mat file
SaveFileName = get(handles.SaveFileEdit,'string');
handles.Path = get(handles.PathField,'string');
%This if is to protect scenarios from being erased with empty variables by
%accidentally pressing save after starting FTT
if handles.ScenariosEmpty == 0
    %save(SaveFileName,'handles');
    for i = 1:length(handles.Scenario)
        if ~isempty(handles.Scenario(i).Names)
            %Note that i-1 concerns that scenario 0 stands for the baseline
            %Note that CDF format does not save tree structures or cell
            %arrays, so we save the variable titles elsewhere
            SaveStruct = handles.Scenario(i);
            SaveStruct.Names = '';
            FTTSaveCDF(strcat(handles.Path,trim3(SaveFileName,'.'),sprintf('%02d',i-1),'.cdf'),SaveStruct);
            VarNames = handles.Scenario(i).Names;
            save(strcat(handles.Path,'FTT61x24v8VarNames.mat'),'VarNames');
            set(handles.Slots(i),'BackgroundColor',[1 0 0]);
        else
            set(handles.Slots(i),'BackgroundColor',[ 0.94118 0.94118 0.94118]);
        end
    end
    set(handles.SavedText,'string','Saved','foregroundcolor','r');
end



function SaveFields(handles)
%---Function that saves in a .mat file the content of the gui input fields
WinPath = handles.Path;
AssumptionsFileName = get(handles.CostsEdit,'string');
HistoricalFileName = get(handles.HistoricalEdit,'string');
CSCDataFileName = get(handles.CSCDataEdit,'string');
ScenarioSaveFileName = get(handles.SaveFileEdit,'string');
EndYear = str2num(get(handles.EndEdit,'string'));
dt = str2num(get(handles.dtEdit,'string'));
if ispc
    %For Windows
    save(strcat(trim3(mfilename('fullpath'),'\'),'\FTT61x24v8filenames.mat'),'WinPath','AssumptionsFileName','HistoricalFileName','CSCDataFileName','ScenarioSaveFileName','EndYear','dt');
else
    %For mac
    save(strcat(trim3(mfilename('fullpath'),'/'),'/FTT61x24v8filenames.mat'),'WinPath','AssumptionsFileName','HistoricalFileName','CSCDataFileName','ScenarioSaveFileName','EndYear','dt');
end

function [k, u] = ScenarioNumber(handles)
%---Function that tells which scenario is the current including the baseline
u = get(handles.UncBox,'Value');
kk = get(get(handles.ScenarioSelector,'SelectedObject'),'string');
switch kk % 0 is for the baseline
    case '0'
        k = 1;
    case '1'
        k = 2;
    case '2'
        k = 3;
    case '3'
        k = 4;
    case '4'
        k = 5;
    case '5'
        k = 6;
    case '6'
        k = 7;
    case '7'
        k = 8;
    case '8'
        k = 9;
    case '9'
        k = 10;
end




function [Unc,SubSheet,FiTSheet,RegSheet,DPSheet,CO2PSheet,MWKASheet] = ReadData(AssumptionsFileName,HistoricalFileName,CSCDataFileName,k,u)
%Filenames is a cell of strings

if (exist(AssumptionsFileName)&exist(HistoricalFileName)&exist(CSCDataFileName))
    hw = waitbar(0,'Reading input data from Excel');
    % select uncertainty assumptions
    UncSheet = xlsread(AssumptionsFileName,'Costs','AH5:BQ63');
    Unc = UncSheet(:,u);
    %read policy data 
    waitbar(1/6);
    SubSheet = xlsread(AssumptionsFileName,strcat('Sub',num2str(k-1)));
    waitbar(2/6);
    FiTSheet = xlsread(AssumptionsFileName,strcat('FiT',num2str(k-1)));
    waitbar(3/6);
    RegSheet = xlsread(AssumptionsFileName,strcat('Reg',num2str(k-1)));
    waitbar(4/6);
    DPSheet = xlsread(AssumptionsFileName,strcat('DP',num2str(k-1)));
    waitbar(5/6);
    CO2PSheet = xlsread(AssumptionsFileName,strcat('CO2P',num2str(k-1)));
    waitbar(6/6);
    MWKASheet = xlsread(AssumptionsFileName,strcat('MWKA',num2str(k-1)));
    close(hw);
else
    errordlg('Assumptions files not found');
    %read policy data 
    Unc = '';
    SubSheet = '';
    FiTSheet = '';
    RegSheet = '';
    DPSheet = '';
    CO2PSheet = '';
    MWKASheet = '';
end


%---
function CalcScenario_Callback(hObject, eventdata, handles)
%---Function that calculates the scenario
[k,u] = ScenarioNumber(handles);

set(handles.Slots(k),'BackgroundColor',[0 1 0]);
%Filenames
Filename = strcat(get(handles.PathField,'string'),get(handles.CostsEdit,'string'));
handlesOut = handles;
AssumptionsFileName = strcat(get(handles.PathField,'string'),get(handles.CostsEdit,'string'));
HistoricalFileName = strcat(get(handles.PathField,'string'),get(handles.HistoricalEdit,'string'));
CSCDataFileName = strcat(get(handles.PathField,'string'),get(handles.CSCDataEdit,'string'));

if ~isempty(handles.HistoricalG)
    %Data
    SW = 0; %for debugging 
    if SW == 0 %Normal operation
        [Unc,SubSheet,FiTSheet,RegSheet,DPSheet,CO2PSheet,MWKASheet] = ReadData(AssumptionsFileName,HistoricalFileName,CSCDataFileName,k,u);
        handles.DataScenario(u).Unc = Unc;
        handles.DataScenario(k).SubSheet = SubSheet;
        handles.DataScenario(k).FiTSheet = FiTSheet;
        handles.DataScenario(k).RegSheet = RegSheet;
        handles.DataScenario(k).DPSheet = DPSheet;
        handles.DataScenario(k).CO2PSheet = CO2PSheet;
        handles.DataScenario(k).MWKASheet = MWKASheet;
    else %For debugging
        Unc = handles.DataScenario(u).Unc;
        SubSheet = handles.DataScenario(k).SubSheet;
        FiTSheet = handles.DataScenario(k).FiTSheet;
        RegSheet = handles.DataScenario(k).RegSheet;
        DPSheet = handles.DataScenario(k).DPSheet;
        CO2PSheet = handles.DataScenario(k).CO2PSheet;
        MWKASheet = handles.DataScenario(k).MWKASheet;
    end
    EndYear = str2num(get(handles.EndEdit,'string'));
    dt = str2num(get(handles.dtEdit,'string'));
    NET = handles.NET; NWR = handles.NWR;
    handles.EndYear = EndYear;
    handles.dt = dt;
    CostSheet = handles.CostSheet;
    HistoricalG = handles.HistoricalG;
    HistoricalE = handles.HistoricalE;
    CapacityFactors = handles.CapacityFactors;
    CSCData = handles.CSCData;    
else
    errordlg('Press "Load History" once first');
end
guidata(hObject, handles);

if ~isempty(CostSheet)
    %Simulation here!
    clear handles.Scenario(k);
    handles.Scenario(k) = FTT61x24v8f(CostSheet,HistoricalG,HistoricalE,CapacityFactors,CSCData,Unc,SubSheet,FiTSheet,RegSheet,DPSheet,CO2PSheet,MWKASheet,dt,NET,NWR,EndYear);
end

set(handles.Slots(k),'BackgroundColor',[1 1 0]);
set(hObject,'value',0);
set(handles.SavedText,'string','Not Saved','foregroundcolor','g');
handles.ScenariosEmpty = 0;
%Get list of variables as defined in the output structure of the calculation
VarList = fieldnames(handles.Scenario(k));
%Discard first few ones (t, th)
set(handles.VarListBox,'string',VarList(3:end));
guidata(hObject, handles);

function out = varname(var)
    out = inputname(1)


function CalcAll_Callback(hObject, eventdata, handles)
%---Function that calculates all baseline+scenarios
kk = str2num(get(handles.MaxScenarioEdit,'string'))+1;
if ~isempty(handles.HistoricalG)
    for k = kk
        set(handles.Slots(k),'BackgroundColor',[0 1 0]);
        %Filenames
        Filename = strcat(get(handles.PathField,'string'),get(handles.CostsEdit,'string'));
        handlesOut = handles;
        AssumptionsFileName = strcat(get(handles.PathField,'string'),get(handles.CostsEdit,'string'));
        HistoricalFileName = strcat(get(handles.PathField,'string'),get(handles.HistoricalEdit,'string'));
        CSCDataFileName = strcat(get(handles.PathField,'string'),get(handles.CSCDataEdit,'string'));
            %Data
            [Unc,SubSheet,FiTSheet,RegSheet,DPSheet,CO2PSheet,MWKASheet] = ReadData(AssumptionsFileName,HistoricalFileName,CSCDataFileName,k,u);
            handles.DataScenario(u).Unc = Unc;
            handles.DataScenario(k).SubSheet = SubSheet;
            handles.DataScenario(k).FiTSheet = FiTSheet;
            handles.DataScenario(k).RegSheet = RegSheet;
            handles.DataScenario(k).DPSheet = DPSheet;
            handles.DataScenario(k).CO2PSheet = CO2PSheet;
            handles.DataScenario(k).MWKASheet = MWKASheet;
            EndYear = str2num(get(handles.EndEdit,'string'));
            dt = str2num(get(handles.dtEdit,'string'));
            NET = handles.NET; NWR = handles.NWR;
            handles.EndYear = EndYear;
            handles.dt = dt;
            CostSheet = handles.CostSheet;
            HistoricalG = handles.HistoricalG;
            HistoricalE = handles.HistoricalE;
            CapacityFactors = handles.CapacityFactors;
            CSCData = handles.CSCData;    
        if ~isempty(CostSheet)
            %Simulation here!
            clear handles.Scenario(k);
            handles.Scenario(k) = FTT61x24v8f(CostSheet,HistoricalG,HistoricalE,CapacityFactors,CSCData,Unc,SubSheet,FiTSheet,RegSheet,DPSheet,CO2PSheet,MWKASheet,dt,NET,NWR,EndYear);
        end
        set(handles.Slots(k),'BackgroundColor',[1 1 0]);
    end
else
    errordlg('Press "Load History" once first');
end

    
    
    
%     %Data
%     [CostSheet,HistoricalG,HistoricalE,CapacityFactors,CSCData,SubSheet,FiTSheet,RegSheet,DPSheet,CO2PSheet,MWKASheet] = ReadData(AssumptionsFileName,HistoricalFileName,CSCDataFileName,k);
% 
%     handles.DataScenario(k).CostSheet = CostSheet;
%     handles.DataScenario(k).HistoricalG = HistoricalG;
%     handles.DataScenario(k).HistoricalE = HistoricalE;
%     handles.DataScenario(k).CapacityFactors = CapacityFactors;
%     handles.DataScenario(k).CSCData = CSCData;
%     handles.DataScenario(k).SubSheet = SubSheet;
%     handles.DataScenario(k).FiTSheet = FiTSheet;
%     handles.DataScenario(k).RegSheet = RegSheet;
%     handles.DataScenario(k).DPSheet = DPSheet;
%     handles.DataScenario(k).CO2PSheet = CO2PSheet;
%     handles.DataScenario(k).MWKASheet = MWKASheet;
%     EndYear = str2num(get(handles.EndEdit,'string'));
%     dt = str2num(get(handles.dtEdit,'string'));
%     NET = handles.NET; NWR = handles.NWR;
%     handles.EndYear = EndYear;
%     handles.dt = dt;
% 
%     if ~isempty(CostSheet)
%         %Simulation here!
%         clear handles.Scenario(k);
%         handles.Scenario(k) = FTT61x24v8f(CostSheet,HistoricalG,HistoricalE,CapacityFactors,CSCData,SubSheet,FiTSheet,RegSheet,DPSheet,CO2PSheet,MWKASheet,dt,NET,NWR,EndYear);
%     end
%     
% end
set(hObject,'value',0);
set(handles.SavedText,'string','Not Saved','foregroundcolor','g');
handles.ScenariosEmpty = 0;
%Get list of variables as defined in the output structure of the calculation
VarList = fieldnames(handles.Scenario(k));
%Discard first few ones (t, th)
set(handles.VarListBox,'string',VarList(3:end));
guidata(hObject, handles);



function [N,AH] = FigureAxes(handles)
%---Function that opens a figure and/or axes depending on what's in fields
N = str2double(get(handles.FigureEdit,'string'));
AH = str2double(get(handles.AxesEdit,'string')); 
if isempty(N) | isnan(N)
    figure(1);
    set(gcf,'position',[584 192 925 624]);
else
    figure(N);
    if isempty(findobj(gcf,'type','axes'))
        set(gcf,'position',[584 192 925 624]);
    end
end
AH = str2double(get(handles.AxesEdit,'string'));
if ~isempty(AH) & ~isnan(AH)
    if AH == 0
        axes(gca); 
    else
        axes(AH);
    end
%else
%    AH = axes('Parent',gcf);
end
set(gca,'ylimmode','auto');

%------------Plot Functions------------------------------------------------

%---
function PlotAllButton_Callback(hObject, eventdata, handles)
%---Function that plots the data with one line per technology
%i = get(get(handles.VariablSelector,'SelectedObject'),'string');
i = get(handles.VarListBox,'Value');
VarList = get(handles.VarListBox,'String');
VarName = VarList{i};
R = get(handles.RegListBox,'Value');
RegList = get(handles.RegListBox,'string');
T = get(handles.TechListBox,'Value');
TechList = get(handles.TechListBox,'string');
k = ScenarioNumber(handles);
RT = get(get(handles.RegTechSelector,'SelectedObject'),'string');

switch RT
    case 'Tech'
        TechStr = TechList(T,:);
        if (length(R) < 4)
            RegStr = RegList(R,:);
        elseif length(R) == handles.NWR
            RegStr = 'World';
        else
            RegStr = '';
        end
    case 'Regions'
        RegStr = RegList(R,:);
        if length(T) < 4
            TechStr = TechList(T,:);
        elseif length(T) == handles.NET
            TechStr = 'All Tech';
        else
            TechStr = '';
        end
end

%Dims: (t, NET, NWR)
if sum(((get(handles.Slots(k),'BackgroundColor')==[1 0 0]) | (get(handles.Slots(k),'BackgroundColor')==[1 1 0])))==3
    [handles.N,handles.AH] = FigureAxes(handles);
    switch VarName
        case 'W'
            switch RT
                case 'Regions'
                    FTT61x24plotXCat(handles.Scenario(k).Ht,sum(handles.Scenario(k).W(:,T),2),TechStr,RegStr);
                    ylabel(handles.Scenario(k).Names.(VarName));
                case 'Tech'
                    FTT61x24plotXCat(handles.Scenario(k).Ht,handles.Scenario(k).W(:,T),RegStr,TechStr);
                    ylabel(handles.Scenario(k).Names.(VarName));
            end
        otherwise
            if size(handles.Scenario(k).(VarName),1) == size(handles.Scenario(k).t,1)
                tname = 't';
            else
                tname = 'Ht';
            end
            if ndims(handles.Scenario(k).(VarName))==2  %Means it's missing the NET dimension
                FTT61x24plotXCat(handles.Scenario(k).(tname),handles.Scenario(k).(VarName)(:,R),RegStr,RegStr);
                ylabel(handles.Scenario(k).Names.(VarName));
            else
                switch RT
                    case 'Regions'
                        FTT61x24plotXCat(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),2),[1 3 2]),TechStr,RegStr);
                        ylabel(handles.Scenario(k).Names.(VarName));
                    case 'Tech'
                        FTT61x24plotXCat(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),3),[1 2 3]),RegStr,TechStr);
                        ylabel(handles.Scenario(k).Names.(VarName));
                end
            end
    end
end

%------------Patch Functions-----------------------------------------------

function PatchAllData_Callback(hObject, eventdata, handles)
%FTTTrpatchARB(XX,YY,Q,L)
%---Function that patches areas for each technology
%---Function that plots the data with one line per technology
%i = get(get(handles.VariablSelector,'SelectedObject'),'string');
i = get(handles.VarListBox,'Value');
VarList = get(handles.VarListBox,'String');
VarName = VarList{i};
R = get(handles.RegListBox,'Value');
RegList = get(handles.RegListBox,'string');
T = get(handles.TechListBox,'Value');
TechList = get(handles.TechListBox,'string');
k = ScenarioNumber(handles);
RT = get(get(handles.RegTechSelector,'SelectedObject'),'string');

switch RT
    case 'Tech'
        TechStr = TechList(T,:);
        if (length(R) < 4)
            RegStr = RegList(R,:);
        elseif length(R) == handles.NWR
            RegStr = 'World';
        else
            RegStr = '';
        end
    case 'Regions'
        RegStr = RegList(R,:);
        if length(T) < 4
            TechStr = TechList(T,:);
        elseif length(T) == handles.NET
            TechStr = 'All Tech';
        else
            TechStr = '';
        end
end

%Dims: (t, NET, NWR)
if sum(((get(handles.Slots(k),'BackgroundColor')==[1 0 0]) | (get(handles.Slots(k),'BackgroundColor')==[1 1 0])))==3
    [handles.N,handles.AH] = FigureAxes(handles);
    switch VarName
        case 'W'
            switch RT
                case 'Regions'
                    FTT61x24v8patch(handles.Scenario(k).Ht,sum(handles.Scenario(k).W(:,T),2),TechStr,RegStr);
                    ylabel(handles.Scenario(k).Names.(VarName));
                case 'Tech'
                    FTT61x24v8patch(handles.Scenario(k).Ht,handles.Scenario(k).W(:,T),RegStr,TechStr);
                    ylabel(handles.Scenario(k).Names.(VarName));
            end
        otherwise
            if size(handles.Scenario(k).(VarName),1) == size(handles.Scenario(k).t,1)
                tname = 't';
            else
                tname = 'Ht';
            end
            if ndims(handles.Scenario(k).(VarName))==2  %Means it's missing the NET dimension
                FTT61x24v8patch(handles.Scenario(k).Ht,handles.Scenario(k).(VarName)(:,R),RegStr,RegStr);
                ylabel(handles.Scenario(k).Names.(VarName));
            else
                switch RT
                    case 'Regions'
                        FTT61x24v8patch(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),2),[1 3 2]),TechStr,RegStr);
                        ylabel(handles.Scenario(k).Names.(VarName));
                    case 'Tech'
                        FTT61x24v8patch(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),3),[1 2 3]),RegStr,TechStr);
                        ylabel(handles.Scenario(k).Names.(VarName));
                end
            end
    end
end

function PatchAggButton_Callback(hObject, eventdata, handles)
%---Function that patches easy to read aggregates
%i = get(get(handles.VariablSelector,'SelectedObject'),'string');
i = get(handles.VarListBox,'Value');
VarList = get(handles.VarListBox,'String');
VarName = VarList{i};
R = get(handles.RegListBox,'Value');
RegList = get(handles.RegListBox,'string');
T = get(handles.TechListBox,'Value');
TechList = get(handles.TechListBox,'string');
k = ScenarioNumber(handles);
RT = get(get(handles.RegTechSelector,'SelectedObject'),'string');

switch RT
    case 'Tech'
        TechStr = TechList(T,:);
        if (length(R) < 4)
            RegStr = RegList(R,:);
        elseif R == handles.NWR
            RegStr = 'World';
        else
            RegStr = '';
        end
    case 'Regions'
        RegStr = RegList(R,:);
        if length(T) < 4
            TechStr = TechList(T,:);
        elseif T == handles.NET
            TechStr = 'All Tech';
        else
            TechStr = '';
        end
end


%Dims: (t, NET, NWR)
if sum(((get(handles.Slots(k),'BackgroundColor')==[1 0 0]) | (get(handles.Slots(k),'BackgroundColor')==[1 1 0])))==3
    [handles.N,handles.AH] = FigureAxes(handles);
    switch VarName
        case 'S'
            switch RT
                case 'Regions'
                    FTTTrpatchAgg(handles.Scenario(k).Ht,permute(sum(handles.Scenario(k).S(:,T,R),2),[1 3 2]),TechStr,handles.RegStrAgg);
                    title('Shares');
                    set(gca,'ylim',[0 1]);
                case 'Tech'
                    FTTTrpatchAgg(handles.Scenario(k).Ht,permute(sum(handles.Scenario(k).S(:,T,R),3),[1 2 3]),RegStr,handles.TechStrAgg);
                    title('Shares');
                    set(gca,'ylim',[0 1]);
            end
        case 'G'
            switch RT
                case 'Regions'
                    FTTTrpatchAgg(handles.Scenario(k).Ht,permute(sum(handles.Scenario(k).G(:,T,R),2),[1 3 2]),TechStr,handles.RegStrAgg);
                    title('Travel (pkm)');
                case 'Tech'
                    FTTTrpatchAgg(handles.Scenario(k).Ht,permute(sum(handles.Scenario(k).G(:,T,R),3),[1 2 3]),RegStr,handles.TechStrAgg);
                    title('Travel (pkm)');
            end
        case 'U'
            switch RT
                case 'Regions'
                    FTTTrpatchAgg(handles.Scenario(k).Ht,permute(sum(handles.Scenario(k).U(:,T,R),2),[1 3 2]),TechStr,handles.RegStrAgg);
                    title('Capacity (k-seats)');
                case 'Tech'
                    FTTTrpatchAgg(handles.Scenario(k).Ht,permute(sum(handles.Scenario(k).U(:,T,R),3),[1 2 3]),RegStr,handles.TechStrAgg);
                    title('Capacity (k-seats)');
            end
        case 'E'
            switch RT
                case 'Regions'
                    FTTTrpatchAgg(handles.Scenario(k).Ht,permute(sum(handles.Scenario(k).E(:,T,R),2),[1 3 2]),TechStr,handles.RegStrAgg);
                    title('Emissions (Mt)');
                case 'Tech'
                    FTTTrpatchAgg(handles.Scenario(k).Ht,permute(sum(handles.Scenario(k).E(:,T,R),3),[1 2 3]),RegStr,handles.TechStrAgg);
                    title('Emissions (Mt)');
            end
        case 'I'
            switch RT
                case 'Regions'
                    FTTTrpatchAgg(handles.Scenario(k).Ht,permute(sum(handles.Scenario(k).I(:,T,R),2),[1 3 2]),TechStr,handles.RegStrAgg);
                    title('New capacity (k-seats)');
                case 'Tech'
                    FTTTrpatchAgg(handles.Scenario(k).Ht,permute(sum(handles.Scenario(k).I(:,T,R),3),[1 2 3]),RegStr,handles.TechStrAgg);
                    title('New capacity (k-seats)');
            end
        case 'W'
            switch RT
                case 'Regions'
                    FTTTrpatchAgg(handles.Scenario(k).Ht,sum(handles.Scenario(k).W(:,T),2),TechStr,handles.RegStrAgg);
                    title('Cumulative capacity (k-seats)');
                case 'Tech'
                    FTTTrpatchAgg(handles.Scenario(k).Ht,handles.Scenario(k).W(:,T),RegStr,handles.TechStrAgg);
                    title('Cumulative capacity (k-seats)');
            end
        otherwise
            if size(handles.Scenario(k).(VarName),1) == size(handles.Scenario(k).t,1)
                tname = 't';
            else
                tname = 'Ht';
            end
            if ndims(handles.Scenario(k).(VarName))==2  %Means it's missing the NET dimension
                FTTTrpatchAgg(handles.Scenario(k).Ht,handles.Scenario(k).(VarName)(:,R),RegStr,handles.RegStrAgg);
                title(VarName);
            else
                switch RT
                    case 'Regions'
                        FTTTrpatchAgg(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),2),[1 3 2]),TechStr,handles.RegStrAgg);
                        title(VarName);
                    case 'Tech'
                        FTTTrpatchAgg(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),3),[1 2 3]),RegStr,handles.TechStrAgg);
                        title(VarName);
                end
            end
    end
end


function HoldOnButton_Callback(hObject, eventdata, handles)
%---Function that executes hold on on the current figure
[handles.N,handles.AH] = FigureAxes(handles);
hold on;


function ExportVarBut_Callback(hObject, eventdata, handles)
%---Function that exports one of the results structures to the workspace
%---(outside of this GUI)

k = ScenarioNumber(handles);
if (get(handles.Slots(k),'BackgroundColor')==[1 0 0] | get(handles.Slots(k),'BackgroundColor')==[1 1 0])
    assignin('base',strcat('Sc',num2str(k-1)),handles.Scenario(k));
end    

function ExportExcel_Callback(hObject, eventdata, handles)
%---Function that exports a dataset to an Excel file
handles.ExportType = 'xls';
DataExport(handles);
guidata(hObject, handles);

function ExportText_Callback(hObject, eventdata, handles)
%---Function that exports a dataset to a Text file
handles.ExportType = 'csv';
DataExport(handles);
guidata(hObject, handles);


function DataExport(handles)
%---Function that exports matrix Data with Header on top
%---into an excel spreadsheet file name FName
%Figure out which button called this (xls or dat)

i = get(handles.VarListBox,'Value');
VarList = get(handles.VarListBox,'String');
VarName = VarList{i};
R = get(handles.RegListBox,'Value');
RegList = get(handles.RegListBox,'string');
T = get(handles.TechListBox,'Value');
TechList = get(handles.TechListBox,'string');
k = ScenarioNumber(handles);
RT = get(get(handles.RegTechSelector,'SelectedObject'),'string');
handles.Path = get(handles.PathField,'string');
handles.FName = strcat(handles.Path,get(handles.ExportFileEdit,'string'));

switch RT
    case 'Tech'
        TechStr = TechList(T,:);
        if (length(R) == 1)
            RegStr = RegList(R,:);
        elseif length(R) == handles.NWR
            RegStr = 'World';
        else
            RegStr = strcat('Sum Regions: ',num2str(R));
        end
    case 'Regions'
        RegStr = RegList(R,:);
        if length(T) == 1
            TechStr = TechList(T,:);
        elseif length(T) == handles.NET
            TechStr = 'All Tech';
        else
            TechStr = strcat('Sum Tech: ',num2str(T));
        end
end

%Dims: (t, NET, NWR)
if sum(((get(handles.Slots(k),'BackgroundColor')==[1 0 0]) | (get(handles.Slots(k),'BackgroundColor')==[1 1 0])))==3
    [handles.N,handles.AH] = FigureAxes(handles);
    switch VarName
        case 'W'
            switch RT
                case 'Regions'
                    FTT61x24plotXCat(handles.Scenario(k).Ht,sum(handles.Scenario(k).W(:,T),2),TechStr,RegStr);
                    ylabel(handles.Scenario(k).Names.(VarName));
                    DataExportWrite(handles,handles.Scenario(k).Ht,sum(handles.Scenario(k).W(:,T),2),TechStr,RegStr,handles.Scenario(k).Names.(VarName));
                case 'Tech'
                    FTT61x24plotXCat(handles.Scenario(k).Ht,handles.Scenario(k).W(:,T),RegStr,TechStr);
                    ylabel(handles.Scenario(k).Names.(VarName));
                    DataExportWrite(handles,handles.Scenario(k).Ht,handles.Scenario(k).W(:,T),RegStr,TechStr,handles.Scenario(k).Names.(VarName));
            end
        otherwise
            if size(handles.Scenario(k).(VarName),1) == size(handles.Scenario(k).t,1)
                tname = 't';
            else
                tname = 'Ht';
            end
            if ndims(handles.Scenario(k).(VarName))==2  %Means it's missing the NET dimension
                FTT61x24plotXCat(handles.Scenario(k).Ht,handles.Scenario(k).(VarName)(:,R),RegStr,RegStr);
                ylabel(handles.Scenario(k).Names.(VarName));
                DataExportWrite(handles,handles.Scenario(k).Ht,handles.Scenario(k).(VarName)(:,R),RegStr,RegStr,handles.Scenario(k).Names.(VarName));
            else
                switch RT
                    case 'Regions'
                        FTT61x24plotXCat(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),2),[1 3 2]),TechStr,RegStr);
                        ylabel(handles.Scenario(k).Names.(VarName));
                        DataExportWrite(handles,handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),2),[1 3 2]),TechStr,RegStr,handles.Scenario(k).Names.(VarName));
                    case 'Tech'
                        FTT61x24plotXCat(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),3),[1 2 3]),RegStr,TechStr);
                        ylabel(handles.Scenario(k).Names.(VarName));
                        DataExportWrite(handles,handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),3),[1 2 3]),RegStr,TechStr,handles.Scenario(k).Names.(VarName));
                end
            end
    end
end

function DataExportWrite(handles,XData,YData,Label,CategTxt,VarName)

FName = handles.FName;
switch handles.ExportType 
    case 'xls'
        %Construct text header
        Header(1,:) = [{'0'} {'FTT61x24v8'} {''} {''} {'Created with FTT:Power v5'} {''} {''}];
        Header(2,:) = [VarName Label {''} {''} {''} {''} {''}];
        %Export data
        if exist(strcat(trim3(FName,'.'),'.xlsx'),'file')
            Sheet = xlsread(strcat(trim3(FName,'.'),'.xlsx'));
            LineN = max(find(sum(~isnan(Sheet),2)))+2;
        else
            LineN = 1;
        end
        X = [min(XData):1:max(round(XData-.5))]';
        Y = interp1N(XData,YData,X);
        Data = [X' ; Y'];
        xlswrite(strcat(trim3(FName,'.'),'.xlsx'),Header,'Sheet1',['A' num2str(LineN)]);
        xlswrite(strcat(trim3(FName,'.'),'.xlsx'),0,'Sheet1',['A' num2str(LineN)]);
        xlswrite(strcat(trim3(FName,'.'),'.xlsx'),CategTxt,'Sheet1',['A' num2str(LineN+3)]);
        xlswrite(strcat(trim3(FName,'.'),'.xlsx'),Data,'Sheet1',['B' num2str(LineN+2)]);
    case 'csv'
        %Construct text header
        Data = [XData';YData'];
        M = cell(size(Data,1)+2,size(Data,2)+1);
        M(1,1:7) = [{'0'} {'FTT61x24v8'} {''} {''} {'Created with FTT:Power v5'} {''} {''}];
        M(2,1:7) = [VarName Label {''} {''} {''} {''} {''}];
        M(4:end,1) = CategTxt;
        M(3:end,2:end) = num2cell(Data);
        writetable(cell2table(M),strcat(trim3(FName,'.'),'.csv'));

        
end



function SeedCrashButton_Callback(hObject, eventdata, handles)
%---Button that brings a dialog box telling the positions of the earliest NaNs in a
%---FTT crash
k = ScenarioNumber(handles);
FTT61x24SeedCrashDlg(handles.Scenario(k));

% --- Executes on selection change in TechListBox.
function TechListBox_Callback(hObject, eventdata, handles)

% --- Executes on selection change in VarListBox.
function VarListBox_Callback(hObject, eventdata, handles)

%change classification in box
i = get(handles.VarListBox,'Value');
VarList = get(handles.VarListBox,'String');
VarName = VarList{i};
if (strcmp(VarName,'P')|strcmp(VarName,'D')|strcmp(VarName,'TPED'))
    set(handles.TechListBox,'string',handles.FuelStr);
    set(handles.TechListBox,'value',1);
elseif strcmp(VarName,'CFbar')
    set(handles.TechListBox,'string','Avg. CF');
    set(handles.TechListBox,'value',1);
elseif (strcmp(VarName,'GLB')|strcmp(VarName,'ULB'))
    set(handles.TechListBox,'string',handles.LBStr);
    set(handles.TechListBox,'value',1);    
elseif (strcmp(VarName,'Curt')|strcmp(VarName,'Ustor')|strcmp(VarName,'Coststor'))
    set(handles.TechListBox,'string','Values');
    set(handles.TechListBox,'value',1);
else
    set(handles.TechListBox,'string',handles.TechStr);
end

% --- Executes on button press in LoadHistBut.
function LoadHistBut_Callback(hObject, eventdata, handles)
AssumptionsFileName = strcat(get(handles.PathField,'string'),get(handles.CostsEdit,'string'));
HistoricalFileName = strcat(get(handles.PathField,'string'),get(handles.HistoricalEdit,'string'));
CSCDataFileName = strcat(get(handles.PathField,'string'),get(handles.CSCDataEdit,'string'));
if exist(HistoricalFileName)
    hw = waitbar(0,'Reading input data from Excel');
    waitbar(1/6);
    % read cost data 
    CostSheet = xlsread(AssumptionsFileName,strcat('Costs'));
    % read historical and resource data 
    waitbar(2/6);
    HistoricalG = xlsread(HistoricalFileName,'HistoricalG');
    waitbar(3/6);
    HistoricalE = xlsread(HistoricalFileName,'HistoricalE');
    waitbar(4/6);
    CapacityFactors = xlsread(HistoricalFileName,'CapacityFactors');
    waitbar(5/6);
    CSCData = xlsread(CSCDataFileName);
    close(hw);
    handles.CostSheet = CostSheet;
    handles.HistoricalG = HistoricalG;
    handles.HistoricalE = HistoricalE;
    handles.CapacityFactors = CapacityFactors;
    handles.CSCData = CSCData;    
else
    errordlg('Assumption file not found');
    % read cost data 
    CostSheet = '';
    % read historical and resource data 
    HistoricalG = '';
    HistoricalE = '';
    CapacityFactors = '';
    CSCData = '';
end
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in GammaBut.
function GammaBut_Callback(hObject, eventdata, handles)

setappdata(0,'hFTT',gcf);
[kk,u] = ScenarioNumber(handles);

%For setting gamma we use the baseline data
setappdata(gcf,'DataScenario',handles.DataScenario(kk));
setappdata(gcf,'CostSheet',handles.CostSheet);
setappdata(gcf,'HistoricalG',handles.HistoricalG);
setappdata(gcf,'HistoricalE',handles.HistoricalE);
setappdata(gcf,'CapacityFactors',handles.CapacityFactors);
setappdata(gcf,'CSCData',handles.CSCData);
setappdata(gcf,'dt',handles.dt);
setappdata(gcf,'EndYear',handles.EndYear);
setappdata(gcf,'CostsFileName',[get(handles.PathField,'string') get(handles.CostsEdit,'string')]);
%setappdata(gcf,'kk',kk);
R = get(handles.RegListBox,'Value');
if length(R) == 1
    setappdata(gcf,'R',R);
else
    setappdata(gcf,'R',min(R));
end

handles.hSetGam = FTT61x24SetGamGUIv2;


%===============================================================================
%==========Useless functions below==============================================
%===============================================================================

function dtEdit_Callback(hObject, eventdata, handles)
% hObject    handle to dtEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dtEdit as text
%        str2double(get(hObject,'String')) returns contents of dtEdit as a double


% --- Executes during object creation, after setting all properties.
function dtEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dtEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function CostsEdit_Callback(hObject, eventdata, handles)
% hObject    handle to CostsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CostsEdit as text
%        str2double(get(hObject,'String')) returns contents of CostsEdit as a double


% --- Executes during object creation, after setting all properties.
function CostsEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CostsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HistoricalEdit_Callback(hObject, eventdata, handles)
% hObject    handle to HistoricalEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HistoricalEdit as text
%        str2double(get(hObject,'String')) returns contents of HistoricalEdit as a double


% --- Executes during object creation, after setting all properties.
function HistoricalEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HistoricalEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CSVHistoricalEdit_Callback(hObject, eventdata, handles)
% hObject    handle to CSVHistoricalEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CSVHistoricalEdit as text
%        str2double(get(hObject,'String')) returns contents of CSVHistoricalEdit as a double


% --- Executes during object creation, after setting all properties.
function CSVHistoricalEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CSVHistoricalEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CSVScenarioEdit_Callback(hObject, eventdata, handles)
% hObject    handle to CSVScenarioEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CSVScenarioEdit as text
%        str2double(get(hObject,'String')) returns contents of CSVScenarioEdit as a double


% --- Executes during object creation, after setting all properties.
function CSVScenarioEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CSVScenarioEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FigureEdit_Callback(hObject, eventdata, handles)
% hObject    handle to FigureEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FigureEdit as text
%        str2double(get(hObject,'String')) returns contents of FigureEdit as a double


% --- Executes during object creation, after setting all properties.
function FigureEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FigureEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AxesEdit_Callback(hObject, eventdata, handles)
% hObject    handle to AxesEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AxesEdit as text
%        str2double(get(hObject,'String')) returns contents of AxesEdit as a double


% --- Executes during object creation, after setting all properties.
function AxesEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AxesEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in P.
function P_Callback(hObject, eventdata, handles)
% hObject    handle to P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of P


% --- Executes on button press in Depletion.
function Depletion_Callback(hObject, eventdata, handles)
% hObject    handle to Depletion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Depletion



function EndEdit_Callback(hObject, eventdata, handles)
% hObject    handle to EndEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndEdit as text
%        str2double(get(hObject,'String')) returns contents of EndEdit as a double


% --- Executes during object creation, after setting all properties.
function EndEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function CSCDataEdit_Callback(hObject, eventdata, handles)
% hObject    handle to CSCDataEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CSCDataEdit as text
%        str2double(get(hObject,'String')) returns contents of CSCDataEdit as a double


% --- Executes during object creation, after setting all properties.
function CSCDataEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CSCDataEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MaxScenarioEdit_Callback(hObject, eventdata, handles)
% hObject    handle to MaxScenarioEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MaxScenarioEdit as text
%        str2double(get(hObject,'String')) returns contents of MaxScenarioEdit as a double


% --- Executes during object creation, after setting all properties.
function MaxScenarioEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxScenarioEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SaveFileEdit_Callback(hObject, eventdata, handles)
% hObject    handle to SaveFileEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SaveFileEdit as text
%        str2double(get(hObject,'String')) returns contents of SaveFileEdit as a double


% --- Executes during object creation, after setting all properties.
function SaveFileEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SaveFileEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function ExportFileEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ExportFileEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ExportFileEdit as text
%        str2double(get(hObject,'String')) returns contents of ExportFileEdit as a double


% --- Executes during object creation, after setting all properties.
function ExportFileEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ExportFileEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ARBList_Callback(hObject, eventdata, handles)
% hObject    handle to ARBList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ARBList as text
%        str2double(get(hObject,'String')) returns contents of ARBList as a double


% --- Executes during object creation, after setting all properties.
function ARBList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ARBList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function TechListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TechListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in RegListBox.
function RegListBox_Callback(hObject, eventdata, handles)
% hObject    handle to RegListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RegListBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RegListBox


% --- Executes during object creation, after setting all properties.
function RegListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RegListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function VarListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VarListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in UncBox.
function UncBox_Callback(hObject, eventdata, handles)
% hObject    handle to UncBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns UncBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from UncBox


% --- Executes during object creation, after setting all properties.
function UncBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UncBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


