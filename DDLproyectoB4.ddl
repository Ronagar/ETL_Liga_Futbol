-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2023-12-22 13:07:44 CET
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE SCHEMA SCHEMA1 
GO

CREATE SCHEMA SCHEMA10 
GO

CREATE SCHEMA SCHEMA11 
GO

CREATE SCHEMA SCHEMA12 
GO

CREATE SCHEMA SCHEMA13 
GO

CREATE SCHEMA SCHEMA14 
GO

CREATE SCHEMA SCHEMA15 
GO

CREATE SCHEMA SCHEMA16 
GO

CREATE SCHEMA SCHEMA17 
GO

CREATE SCHEMA SCHEMA18 
GO

CREATE SCHEMA SCHEMA19 
GO

CREATE SCHEMA SCHEMA2 
GO

CREATE SCHEMA SCHEMA20 
GO

CREATE SCHEMA SCHEMA21 
GO

CREATE SCHEMA SCHEMA22 
GO

CREATE SCHEMA SCHEMA23 
GO

CREATE SCHEMA SCHEMA24 
GO

CREATE SCHEMA SCHEMA25 
GO

CREATE SCHEMA SCHEMA26 
GO

CREATE SCHEMA SCHEMA27 
GO

CREATE SCHEMA SCHEMA28 
GO

CREATE SCHEMA SCHEMA29 
GO

CREATE SCHEMA SCHEMA3 
GO

CREATE SCHEMA SCHEMA30 
GO

CREATE SCHEMA SCHEMA31 
GO

CREATE SCHEMA SCHEMA32 
GO

CREATE SCHEMA SCHEMA33 
GO

CREATE SCHEMA SCHEMA4 
GO

CREATE SCHEMA SCHEMA5 
GO

CREATE SCHEMA SCHEMA6 
GO

CREATE SCHEMA SCHEMA7 
GO

CREATE SCHEMA SCHEMA8 
GO

CREATE SCHEMA SCHEMA9 
GO

CREATE TABLE Campo 
    (
     CampoID INTEGER IDENTITY(1,1) NOT NULL , 
     "Key" VARCHAR (50) NOT NULL , 
     Titulo VARCHAR (50) NOT NULL , 
     Desde INTEGER , 
     Capacidad INTEGER , 
     Ciudad_CiudadID INTEGER 
    )
GO

ALTER TABLE Campo ADD CONSTRAINT Campo_PK PRIMARY KEY CLUSTERED (CampoID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Ciudad 
    (
     CiudadID INTEGER IDENTITY(1,1) NOT NULL , 
     Nombre VARCHAR (50) NOT NULL , 
     Clave VARCHAR (50) NOT NULL , 
     Pais_PaisID INTEGER NOT NULL 
    )
GO

ALTER TABLE Ciudad ADD CONSTRAINT Ciudad_PK PRIMARY KEY CLUSTERED (CiudadID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Continente 
    (
     ContinenteID INTEGER IDENTITY(1,1) NOT NULL , 
     Nombre VARCHAR (50) NOT NULL , 
     slug VARCHAR (50) NOT NULL , 
     Clave VARCHAR (50) NOT NULL 
    )
GO

ALTER TABLE Continente ADD CONSTRAINT Continente_PK PRIMARY KEY CLUSTERED (ContinenteID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Equipo 
    (
     EquipoID INTEGER NOT NULL , 
     Titulo VARCHAR (50) NOT NULL , 
     Codigo VARCHAR (50) , 
     Clave VARCHAR (50) NOT NULL , 
     Sinonimo VARCHAR (256) , 
     Campo_CampoID INTEGER 
    )
GO

ALTER TABLE Equipo ADD CONSTRAINT Equipo_PK PRIMARY KEY CLUSTERED (EquipoID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Evento 
    (
     ID INTEGER NOT NULL , 
     Clave VARCHAR (50) NOT NULL , 
     Liga_LigaID INTEGER NOT NULL , 
     Temporada_temporadaID INTEGER NOT NULL 
    )
GO

ALTER TABLE Evento ADD CONSTRAINT Evento_PK PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Liga 
    (
     LigaID INTEGER NOT NULL , 
     "Key" VARCHAR (50) NOT NULL , 
     L_titulo VARCHAR (50) NOT NULL 
    )
GO

ALTER TABLE Liga ADD CONSTRAINT Liga_PK PRIMARY KEY CLUSTERED (LigaID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Pais 
    (
     PaisID INTEGER IDENTITY(1,1) NOT NULL , 
     Nombre VARCHAR (50) NOT NULL , 
     slug VARCHAR (50) NOT NULL , 
     Clave VARCHAR (50) NOT NULL , 
     Codigo VARCHAR (50) NOT NULL , 
     nombreAlternativo VARCHAR (50) , 
     Poblacion INTEGER NOT NULL , 
     Area INTEGER NOT NULL , 
     motor VARCHAR (50) , 
     alpha2 VARCHAR (50) , 
     alpha3 VARCHAR (50) , 
     num VARCHAR (50) , 
     fifa VARCHAR (50) , 
     ioc VARCHAR (50) , 
     fips VARCHAR (50) , 
     net VARCHAR (50) , 
     Continente_ContinenteID INTEGER NOT NULL 
    )
GO

ALTER TABLE Pais ADD CONSTRAINT Pais_PK PRIMARY KEY CLUSTERED (PaisID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Partido 
    (
     Knockout BIT NOT NULL , 
     Score_1 INTEGER , 
     Score_2 INTEGER , 
     Ganador INTEGER , 
     Equipo_EquipoID INTEGER NOT NULL , 
     Equipo_EquipoID2 INTEGER NOT NULL , 
     Ronda_RondaID INTEGER NOT NULL , 
     JuegoID INTEGER NOT NULL , 
     pos INTEGER NOT NULL , 
     Local BIT NOT NULL , 
     Tiempo_Fecha INTEGER NOT NULL 
    )
GO

ALTER TABLE Partido ADD CONSTRAINT Partido_PK PRIMARY KEY CLUSTERED (Equipo_EquipoID, Equipo_EquipoID2, Ronda_RondaID, JuegoID, Tiempo_Fecha)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Ronda 
    (
     RondaID INTEGER NOT NULL , 
     Titulo VARCHAR (50) NOT NULL , 
     Pos INTEGER NOT NULL , 
     Evento_ID INTEGER NOT NULL 
    )
GO

ALTER TABLE Ronda ADD CONSTRAINT Ronda_PK PRIMARY KEY CLUSTERED (RondaID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Temporada 
    (
     temporadaID INTEGER NOT NULL , 
     "Key" VARCHAR (50) NOT NULL , 
     Titulo VARCHAR (50) NOT NULL 
    )
GO

ALTER TABLE Temporada ADD CONSTRAINT Temporada_PK PRIMARY KEY CLUSTERED (temporadaID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Tiempo 
    (
     Fecha INTEGER IDENTITY(1,1) NOT NULL , 
     Dia INTEGER , 
     Mes INTEGER , 
     Año INTEGER 
    )
GO

ALTER TABLE Tiempo ADD CONSTRAINT Tiempo_PK PRIMARY KEY CLUSTERED (Fecha)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Campo 
    ADD CONSTRAINT Campo_Ciudad_FK FOREIGN KEY 
    ( 
     Ciudad_CiudadID
    ) 
    REFERENCES Ciudad 
    ( 
     CiudadID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Ciudad 
    ADD CONSTRAINT Ciudad_Pais_FK FOREIGN KEY 
    ( 
     Pais_PaisID
    ) 
    REFERENCES Pais 
    ( 
     PaisID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Equipo 
    ADD CONSTRAINT Equipo_Campo_FK FOREIGN KEY 
    ( 
     Campo_CampoID
    ) 
    REFERENCES Campo 
    ( 
     CampoID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Evento 
    ADD CONSTRAINT Evento_Liga_FK FOREIGN KEY 
    ( 
     Liga_LigaID
    ) 
    REFERENCES Liga 
    ( 
     LigaID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Evento 
    ADD CONSTRAINT Evento_Temporada_FK FOREIGN KEY 
    ( 
     Temporada_temporadaID
    ) 
    REFERENCES Temporada 
    ( 
     temporadaID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pais 
    ADD CONSTRAINT Pais_Continente_FK FOREIGN KEY 
    ( 
     Continente_ContinenteID
    ) 
    REFERENCES Continente 
    ( 
     ContinenteID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Partido 
    ADD CONSTRAINT Partido_Equipo_FK FOREIGN KEY 
    ( 
     Equipo_EquipoID
    ) 
    REFERENCES Equipo 
    ( 
     EquipoID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Partido 
    ADD CONSTRAINT Partido_Equipo_FKv2 FOREIGN KEY 
    ( 
     Equipo_EquipoID2
    ) 
    REFERENCES Equipo 
    ( 
     EquipoID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Partido 
    ADD CONSTRAINT Partido_Ronda_FK FOREIGN KEY 
    ( 
     Ronda_RondaID
    ) 
    REFERENCES Ronda 
    ( 
     RondaID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Partido 
    ADD CONSTRAINT Partido_Tiempo_FK FOREIGN KEY 
    ( 
     Tiempo_Fecha
    ) 
    REFERENCES Tiempo 
    ( 
     Fecha 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Ronda 
    ADD CONSTRAINT Ronda_Evento_FK FOREIGN KEY 
    ( 
     Evento_ID
    ) 
    REFERENCES Evento 
    ( 
     ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             22
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                           33
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
