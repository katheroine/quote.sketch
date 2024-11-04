COPY (
    SELECT
        q.id as id,
        a.penname as author_penname,
        s.title as source_title,
        c.content as content
    FROM
        quote as q
    LEFT JOIN content as c on q.content_id = c.id
    LEFT JOIN source as s ON q.source_id = s.id
    LEFT JOIN quote_author qa ON q.id = qa.quote_id
    LEFT JOIN author a ON a.id = qa.author_id
    ORDER BY source_title, author_penname
) TO 'path-to-repository/quote.pro/quote.sketch/quotes_with_authors_and_sources.txt';
