for i in dmd.getSubObjects():
   try:
      i.checkRelations(repair=True)
   except:
      print "Failed on %s" % i
      pass

commit()