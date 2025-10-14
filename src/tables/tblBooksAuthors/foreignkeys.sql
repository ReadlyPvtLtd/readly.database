CALL usp_CreateForeignKey('tblBooksAuthors', 'book_id', 'tblBooks', 'id');
CALL usp_CreateForeignKey('tblBooksAuthors', 'author_id', 'tblAuthors', 'id');