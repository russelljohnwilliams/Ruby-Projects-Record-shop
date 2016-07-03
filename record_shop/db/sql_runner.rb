require('pg')

def run_sql(sql)
  db = PG.connect( {dbname:'record_shop', host:'localhost'} )
  result = db.exec( sql )
  db.close()
  return result
end


