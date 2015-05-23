You can use the new literal map syntax in Neo4j 2.0 and do something like:

MATCH (n:Person) 
RETURN { Name: n.name , Born: n.born } as Person 
ORDER BY n.born 
LIMIT 5

MATCH (x)-[rels*]->(y)
UNWIND rels AS rel
RETURN COLLECT( distinct rel.property) AS collected

match (n:Test) UNWIND n.pro  AS rel return rel;