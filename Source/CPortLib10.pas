{ Ce fichier a �t� automatiquement cr�� par Lazarus. Ne pas l'�diter !
This source is only used to compile and install the package.
 }

unit CPortLib10; 

interface

uses
  CPort, CPortSetup, CPortCtl, CPortEsc, CPortTrmSet, CPortReg, 
    LazarusPackageIntf; 

implementation

procedure Register; 
begin
  RegisterUnit('CPortReg', @CPortReg.Register); 
end; 

initialization
  RegisterPackage('CPortLib10', @Register); 
end.
