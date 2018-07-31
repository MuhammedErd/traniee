CREATE PROCEDURE relations
(
@modelname1 varchar (30),
@objname1 varchar(30)
)
AS

BEGIN

SELECT DISTINCT 
                MODEL.[NAME] AS MODEL_NAME, 
	        SRC.[OBJT],
                SRC.[NAME] AS SRC_NAME,
		RLSH.[TRGT],
		TRG.[NAME] AS TRGT_NAME,
		CLSS.[NAME] AS TRGT_CLSS,
		TRG.[VRSN] 

FROM  [Repo-db].[dbo].[PMOBJT] MODEL, [Repo-db].[dbo].[PMCLSS] M_CLSS,
      [Repo-db].[dbo].[PMOBJT] SRC,   [Repo-db].[dbo].[PMCLSS] CLSS,
      [Repo-db].[dbo].[PMRLSH] RLSH,  [Repo-db].[dbo].[PMOBJT] TRG


WHERE SRC.NAME = @objname1 AND SRC.OBJT = RLSH.SRCE AND SRC.LVRS = 1
  AND TRG.OBJT = RLSH.TRGT AND CLSS.CLSS = TRG.CLSS AND TRG.LVRS = 1
  AND MODEL.NAME = @modelname1 AND M_CLSS.CODE = 'MODEL' AND MODEL.LVRS = 1
  
END
