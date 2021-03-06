CREATE DATABASE [PizzariaSys]

GO
USE [PizzariaSys]

GO
CREATE TABLE [dbo].[tblCliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Logradouro] [varchar](200) NOT NULL,
	[Numero] [int] NOT NULL,
	[Bairro] [varchar](100) NOT NULL,
	[Telefone] [varchar](11) NOT NULL,
 CONSTRAINT [PK_tblCliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[uspClienteInserir]    Script Date: 05/01/2016 03:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspClienteInserir]

@Nome as varchar(100),
@Logradouro as varchar(200),
@Numero as int,
@Bairro as varchar(100),
@Telefone as varchar(11)


as
begin

	insert into tblCliente
	(Nome, Logradouro, Numero, Bairro, Telefone)
	values
	(@Nome,@Logradouro, @Numero, @Bairro, @Telefone)

	select @@IDENTITY as retorno

end
GO
/****** Object:  StoredProcedure [dbo].[uspClienteListarTelefone]    Script Date: 05/01/2016 03:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspClienteListarTelefone]

@Telefone as varchar(11)

as
begin

	select * from tblCliente

	where Telefone = @Telefone

end
GO
/****** Object:  StoredProcedure [dbo].[uspClienteListarTodos]    Script Date: 05/01/2016 03:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
create procedure [dbo].[uspClienteListarTodos]


as
begin

select * from tblCliente

end

GO
USE [master]
GO
ALTER DATABASE [PizzariaSys] SET  READ_WRITE 
GO
