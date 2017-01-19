/*
Created: 11/01/2017
Modified: 12/01/2017
Model: Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create schemas section -------------------------------------------------

CREATE SCHEMA [Contabilidad]
go

CREATE SCHEMA [Ganaderia]
go

CREATE SCHEMA [Personal]
go

-- Create tables section -------------------------------------------------

-- Table Contabilidad.Asientos

CREATE TABLE [Contabilidad].[Asientos]
(
 [AsientoID] Bigint IDENTITY(1,1) NOT NULL,
 [Fecha] Date NOT NULL,
 [Ej] Int NOT NULL,
 [Nro] Int NOT NULL,
 [Subd] Int NOT NULL,
 [CuentaID] Int NOT NULL,
 [Tl] Money NOT NULL,
 [Moneda] Varchar(50) DEFAULT 'Guaranies' NOT NULL,
 [Detalle] Text NOT NULL
)
go
EXEC sp_addextendedproperty 'MS_Description', 'Este es el total, si es DEVITO es positivo si es CREDITO es negativo', 'SCHEMA', 'Contabilidad', 'TABLE', 'Asientos', 'COLUMN', 'Tl'
go
EXEC sp_addextendedproperty 'MS_Description', 'Determina que moneda se va a utilizar, por defecto es Guaranies', 'SCHEMA', 'Contabilidad', 'TABLE', 'Asientos', 'COLUMN', 'Moneda'
go

-- Create indexes for table Contabilidad.Asientos

CREATE INDEX [IX_Asientos_cuentas-CuentaID] ON [Contabilidad].[Asientos] ([CuentaID])
go

CREATE INDEX [IX_Asientos-NomenReferencias_Nro] ON [Contabilidad].[Asientos] ([Nro])
go

CREATE UNIQUE INDEX [IX_Asientos_Ej-Nro-Subd] ON [Contabilidad].[Asientos] ([Ej],[Nro],[Subd])
go

-- Add keys for table Contabilidad.Asientos

ALTER TABLE [Contabilidad].[Asientos] ADD CONSTRAINT [Pk_Asientos] PRIMARY KEY ([AsientoID])
go

-- Table Contabilidad.Cuentas

CREATE TABLE [Contabilidad].[Cuentas]
(
 [CuentaID] Int IDENTITY(1,1) NOT NULL,
 [Codigo] Varchar(50) NOT NULL,
 [Nombre] Varchar(50) NOT NULL,
 [Imputable] Bit NOT NULL,
 [EmpresaID] Int NOT NULL
)
go
EXEC sp_addextendedproperty 'MS_Description', 'Este campo establese si es una cuenta imputable o es solo un titulo como ACTIVO o PASIVO', 'SCHEMA', 'Contabilidad', 'TABLE', 'Cuentas', 'COLUMN', 'Imputable'
go

-- Create indexes for table Contabilidad.Cuentas

CREATE INDEX [IX_Relationship10] ON [Contabilidad].[Cuentas] ([EmpresaID])
go

-- Add keys for table Contabilidad.Cuentas

ALTER TABLE [Contabilidad].[Cuentas] ADD CONSTRAINT [Pk_Cuentas] PRIMARY KEY ([CuentaID])
go

-- Table Ganaderia.Campana

CREATE TABLE [Ganaderia].[Campana]
(
 [CampanaID] Int IDENTITY(1,1) NOT NULL,
 [FechaLimite] Date NOT NULL,
 [Nombre] Varchar(50) NOT NULL
)
go

EXEC sp_addextendedproperty 'MS_Description', 'Deveria de ser campaña con Ñ pero como la ñ no es un caracter utilizado frecuentemente le pongo solo n', 'SCHEMA', 'Ganaderia', 'TABLE', 'Campana', NULL, NULL
go
EXEC sp_addextendedproperty 'MS_Description', 'Este campo determina cuando comienza la campaña, la campaña termina un dia antes del comienzo de la otra campaña', 'SCHEMA', 'Ganaderia', 'TABLE', 'Campana', 'COLUMN', 'FechaLimite'
go

-- Add keys for table Ganaderia.Campana

ALTER TABLE [Ganaderia].[Campana] ADD CONSTRAINT [Pk_Campana] PRIMARY KEY ([CampanaID])
go

-- Table Ganaderia.CentroDeCostos

CREATE TABLE [Ganaderia].[CentroDeCostos]
(
 [CentroDeCostoID] Int IDENTITY(1,1) NOT NULL,
 [Nombre] Varchar(50) NOT NULL
)
go

-- Add keys for table Ganaderia.CentroDeCostos

ALTER TABLE [Ganaderia].[CentroDeCostos] ADD CONSTRAINT [Pk_CentroDeCostos] PRIMARY KEY ([CentroDeCostoID])
go

-- Table Ganaderia.UnidadesNegocios

CREATE TABLE [Ganaderia].[UnidadesNegocios]
(
 [UnidadNegocioID] Int IDENTITY(1,1) NOT NULL,
 [Nombre] Varchar(50) NOT NULL
)
go

-- Add keys for table Ganaderia.UnidadesNegocios

ALTER TABLE [Ganaderia].[UnidadesNegocios] ADD CONSTRAINT [Key1] PRIMARY KEY ([UnidadNegocioID])
go

-- Table Ganaderia.UnidadNegSeleccionados

CREATE TABLE [Ganaderia].[UnidadNegSeleccionados]
(
 [CentroDeCostoID] Int NOT NULL,
 [UnidadNegocioID] Int NOT NULL
)
go

-- Add keys for table Ganaderia.UnidadNegSeleccionados

ALTER TABLE [Ganaderia].[UnidadNegSeleccionados] ADD CONSTRAINT [Pk_UnidadNegSeleccionados] PRIMARY KEY ([CentroDeCostoID],[UnidadNegocioID])
go

-- Table Ganaderia.AsientosCc

CREATE TABLE [Ganaderia].[AsientosCc]
(
 [AsientoID] Bigint NOT NULL,
 [CentroDeCostoID] Int NOT NULL,
 [UnidadNegocioID] Int NOT NULL
)
go

EXEC sp_addextendedproperty 'MS_Description', 'Es la parte donde se coloca el centro de costo y se separa para cuando no se necesite CENTROS DE COSTOS', 'SCHEMA', 'Ganaderia', 'TABLE', 'AsientosCc', NULL, NULL
go

-- Add keys for table Ganaderia.AsientosCc

ALTER TABLE [Ganaderia].[AsientosCc] ADD CONSTRAINT [Pk_AsientosCc] PRIMARY KEY ([AsientoID],[CentroDeCostoID],[UnidadNegocioID])
go

-- Table Contabilidad.NomenReferencias

CREATE TABLE [Contabilidad].[NomenReferencias]
(
 [Nro] Int NOT NULL,
 [Descripcion] Varchar(200) NOT NULL,
 [TipoContabilidadID] Int NULL
)
go

EXEC sp_addextendedproperty 'MS_Description', 'Es la tabla que muestra las nomenclaturas de referencias, es decir el satelite que disparo la creacion del asiento.', 'SCHEMA', 'Contabilidad', 'TABLE', 'NomenReferencias', NULL, NULL
go
EXEC sp_addextendedproperty 'MS_Description', 'Cuando el tipo de contabilidad es nulo, significa que este numero puede usarse y todos los tipos de contabilidades', 'SCHEMA', 'Contabilidad', 'TABLE', 'NomenReferencias', 'COLUMN', 'TipoContabilidadID'
go

INSERT INTO [Contabilidad].[NomenReferencias] ([Nro],[Descripcion],[TipoContabilidadID])
VALUES
(         0,'Asientos Manuales', 1),                                                                                                                                                                                       
(         1,'Items de Ordenes de Servicio', 1),                                                                                                                                                                            
(         3,'Ordenes de Pago - Comp. Contado', 1),                                                                                                                                                                         
(        11,'Comprobantes de Compra', 1),                                                                                                                                                                                  
(        12,'Comprobantes de Venta', 1),                                                                                                                                                                                   
(        13,'Recibos', 1),                                                                                                                                                                                                 
(        14,'Movimientos de Cosecha', 1),                                                                                                                                                                                  
(        15,'Otros Movimientos de Balanza', 1),                                                                                                                                                                            
(        16,'Consumo de Producción', 1),                                                                                                                                                                                   
(        17,' Movimientos de Venta', 1),                                                                                                                                                                                   
(        18,'Remitos de Compra', 1),                                                                                                                                                                                       
(        19,'Registro de Labores', 1),                                                                                                                                                                                     
(        20,'Consumos de Insumo', 1),                                                                                                                                                                                      
(        21,'Movimientos de Hacienda', 1),                                                                                                                                                                                 
(        22,'Ordenes de Compra de Insumos', 1),                                                                                                                                                                            
(        23,'Viajes', 1),                                                                                                                                                                                                  
(        24,'Registros de Tratamientos', 1),                                                                                                                                                                               
(        25,'Movimientos de Acopio', 1),                                                                                                                                                                                   
(        26,'Trabajos Personal Transitorio', 1),                                                                                                                                                                           
(        27,'Ordenes de Compra de Ganadería', 1),                                                                                                                                                                          
(        28,'Retenciones SUSS', 1),                                                                                                                                                                                        
(        29,'Retenciones Inspección Seguridad', 1),                                                                                                                                                                        
(        31,'Retenciones de Ganancias', 1),                                                                                                                                                                                
(        32,'Retenciones de IIBB', 1),                                                                                                                                                                                     
(        36,'Ordenes de Venta', 1),                                                                                                                                                                                        
(        51,'Compras Socios', 1),                                                                                                                                                                                          
(        55,'Transferencia de Kg entre Contratos', 1),                                                                                                                                                                     
(        56,'CDI', 1),                                                                                                                                                                                                     
(        57,'Arrendamientos', 1),                                                                                                                                                                                          
(        58,'Aportes de Inversores', 1),                                                                                                                                                                                   
(        59,'Cierre de Contab. de Stocks', 1),                                                                                                                                                                             
(        61,'Fletes Enganchados', 1),                                                                                                                                                                                      
(        62,'Asiento de Costos de Venta', 1),                                                                                                                                                                              
(        65,'Asiento con Diferentes Cotizaciones', 1),                                                                                                                                                                     
(        70,'Ingreso de Materia Prima para Producción', 1),                                                                                                                                                                
(        80,'Amortizaciones de Bienes de Uso', 1),                                                                                                                                                                         
(        81,'Ordenes de Venta de Exportación', 1),                                                                                                                                                                         
(        82,'Asientos de Baja de Insumos', 1),                                                                                                                                                                             
(       100,'Asiento de Cierre de Ejercicio', 1),                                                                                                                                                                          
(       120,'Asiento de Ajuste de Insumos', 1),                                                                                                                                                                            
(        60,'Remitos de Venta', 1),                                                                                                                                                                                        
(         5,'Asientos de Sueldos', 1),                                                                                                                                                                                     
(        43,'Cierre de Moneda Fiscal', 1),                                                                                                                                                                                 
(        71,'Cierre de Maquinaria de Turno', 1),                                                                                                                                                                           
(        72,'Cierre de Turno', 1),                                                                                                                                                                                         
(        40,'Partes de Leche', 1),                                                                                                                                                                                         
(        30,'Ordenes de Servicio', 1),                                                                                                                                                                                     
(        33,'Asiento Diferencia Cambio Dolar', 1)  
go

-- Create indexes for table Contabilidad.NomenReferencias

CREATE INDEX [IX_Relationship9] ON [Contabilidad].[NomenReferencias] ([TipoContabilidadID])
go

-- Add keys for table Contabilidad.NomenReferencias

ALTER TABLE [Contabilidad].[NomenReferencias] ADD CONSTRAINT [Key2] PRIMARY KEY ([Nro])
go

-- Table Contabilidad.AsientosManuales

CREATE TABLE [Contabilidad].[AsientosManuales]
(
 [AsientoManual] Bigint IDENTITY(1,1) NOT NULL,
 [Fecha] Date NOT NULL,
 [Ej] Int NOT NULL,
 [Subd] Int NOT NULL,
 [Descripcion] Text NOT NULL,
 [AsientoCuadrado] Bit DEFAULT 0 NOT NULL
)
go

EXEC sp_addextendedproperty 'MS_Description', 'Es la cabecera de los asientos manuales, este no tiene el Nro, pues en el caso de los asientos manuales siempre sera cero', 'SCHEMA', 'Contabilidad', 'TABLE', 'AsientosManuales', NULL, NULL
go
EXEC sp_addextendedproperty 'MS_Description', 'Si el asiento esta cuadrado el valor es 1, esto tiene que ser protegido por un procedimiento almacenado', 'SCHEMA', 'Contabilidad', 'TABLE', 'AsientosManuales', 'COLUMN', 'AsientoCuadrado'
go

-- Create indexes for table Contabilidad.AsientosManuales

CREATE INDEX [IX_AsientosManuales-Ej_Subd] ON [Contabilidad].[AsientosManuales] ([Ej],[Subd])
go

-- Add keys for table Contabilidad.AsientosManuales

ALTER TABLE [Contabilidad].[AsientosManuales] ADD CONSTRAINT [Pk_AsientosManuales] PRIMARY KEY ([AsientoManual])
go

-- Table Contabilidad.Empresas

CREATE TABLE [Contabilidad].[Empresas]
(
 [EmpresaID] Int IDENTITY(1,1) NOT NULL,
 [Nombre] Varchar(100) NOT NULL,
 [TipoContabilidadID] Int NOT NULL
)
go

-- Create indexes for table Contabilidad.Empresas

CREATE INDEX [IX_Relationship11] ON [Contabilidad].[Empresas] ([TipoContabilidadID])
go

-- Add keys for table Contabilidad.Empresas

ALTER TABLE [Contabilidad].[Empresas] ADD CONSTRAINT [Key3] PRIMARY KEY ([EmpresaID])
go

-- Table Contabilidad.TipoContabilidades

CREATE TABLE [Contabilidad].[TipoContabilidades]
(
 [TipoContabilidadID] Int NOT NULL,
 [Descripcion] Varchar(100) NOT NULL
)
go

INSERT INTO [Contabilidad].[TipoContabilidades]
           ([TipoContabilidadID]
           ,[Descripcion])
     VALUES
           (1,'Ganadero'),
           (2,'Comercial'),
           (3,'Personal'),
           (4,'Cooperativa')
          
GO

-- Add keys for table Contabilidad.TipoContabilidades

ALTER TABLE [Contabilidad].[TipoContabilidades] ADD CONSTRAINT [Key4] PRIMARY KEY ([TipoContabilidadID])
go

-- Create relationships section ------------------------------------------------- 

ALTER TABLE [Contabilidad].[Asientos] ADD CONSTRAINT [Fk_Asientos-Cuentas] FOREIGN KEY ([CuentaID]) REFERENCES [Contabilidad].[Cuentas] ([CuentaID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Ganaderia].[UnidadNegSeleccionados] ADD CONSTRAINT [Pfk_UnidadNegSeleccionados-CentroDeCostos] FOREIGN KEY ([CentroDeCostoID]) REFERENCES [Ganaderia].[CentroDeCostos] ([CentroDeCostoID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Ganaderia].[UnidadNegSeleccionados] ADD CONSTRAINT [Pfk_UnidadNegSeleccionados-UnidadesNegocios] FOREIGN KEY ([UnidadNegocioID]) REFERENCES [Ganaderia].[UnidadesNegocios] ([UnidadNegocioID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Ganaderia].[AsientosCc] ADD CONSTRAINT [FPK_AsientoCc-Asientos] FOREIGN KEY ([AsientoID]) REFERENCES [Contabilidad].[Asientos] ([AsientoID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Ganaderia].[AsientosCc] ADD CONSTRAINT [Pfk_AsientosCc-UnidadNegSeleccionados] FOREIGN KEY ([CentroDeCostoID], [UnidadNegocioID]) REFERENCES [Ganaderia].[UnidadNegSeleccionados] ([CentroDeCostoID], [UnidadNegocioID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Contabilidad].[Asientos] ADD CONSTRAINT [fk_Asientos-NomenReferencias] FOREIGN KEY ([Nro]) REFERENCES [Contabilidad].[NomenReferencias] ([Nro]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Contabilidad].[NomenReferencias] ADD CONSTRAINT [Fk_NomenReferencias-TipoContabilidades] FOREIGN KEY ([TipoContabilidadID]) REFERENCES [Contabilidad].[TipoContabilidades] ([TipoContabilidadID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Contabilidad].[Cuentas] ADD CONSTRAINT [Relationship10] FOREIGN KEY ([EmpresaID]) REFERENCES [Contabilidad].[Empresas] ([EmpresaID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Contabilidad].[Empresas] ADD CONSTRAINT [Fk_Empresas-TipoContabilidades] FOREIGN KEY ([TipoContabilidadID]) REFERENCES [Contabilidad].[TipoContabilidades] ([TipoContabilidadID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



