USE [ProjetoOficinaLojaDb];
GO

SET XACT_ABORT ON;
BEGIN TRANSACTION;

IF NOT EXISTS (SELECT 1 FROM dbo.Categorias WHERE Nome = N'Notebooks')
    INSERT INTO dbo.Categorias (Nome, Descricao)
    VALUES (N'Notebooks', N'Computadores portáteis');

IF NOT EXISTS (SELECT 1 FROM dbo.Categorias WHERE Nome = N'Áudio')
    INSERT INTO dbo.Categorias (Nome, Descricao)
    VALUES (N'Áudio', N'Fones e acessórios');

DECLARE @Notebooks int =
    (SELECT TOP (1) Id FROM dbo.Categorias WHERE Nome = N'Notebooks' ORDER BY Id);
DECLARE @Audio int =
    (SELECT TOP (1) Id FROM dbo.Categorias WHERE Nome = N'Áudio' ORDER BY Id);

IF NOT EXISTS (SELECT 1 FROM dbo.Produtos WHERE Nome = N'Notebook de estudos')
    INSERT INTO dbo.Produtos (Nome, Descricao, Preco, Estoque, ImagemUrl, Ativo, CategoriaId)
    VALUES (
        N'Notebook de estudos',
        N'Produto de demonstração. Foto ilustrativa.',
        2499.90,
        5,
        N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853',
        1,
        @Notebooks
    );

IF NOT EXISTS (SELECT 1 FROM dbo.Produtos WHERE Nome = N'Fone sem fio')
    INSERT INTO dbo.Produtos (Nome, Descricao, Preco, Estoque, ImagemUrl, Ativo, CategoriaId)
    VALUES (
        N'Fone sem fio',
        N'Produto de demonstração. Foto ilustrativa.',
        149.90,
        10,
        N'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
        1,
        @Audio
    );

COMMIT;
GO
