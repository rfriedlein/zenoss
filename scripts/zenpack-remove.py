packs = None
if hasattr(dmd, 'ZenPackManager'):
        packs = dmd.ZenPackManager.packs
else:
        packs = dmd.packs

phase2 = False

for pack in packs():
        try:
                unused = pack.primaryAq()
                print "%s is fine." % pack.id
        except AttributeError:
                print "Problem with %s ZenPack. Forcing removal." % pack.id
                try:
                        packs._remove(pack)
                        print "Removed %s ZenPack." % pack.id
                except AttributeError:
                        print "Unable to remove this ZenPack."
                        phase2 = True

# There were some packs we could not remove using the _remove method. Fall back to 
# a deeper removal approach using pack ID.

if phase2:
        print
        print "Starting Phase 2 removal"
        print
        all_pack_ids = []
        for pack_id in dmd.ZenPackManager.packs._objects:
                all_pack_ids.append(pack_id)

        valid_pack_ids = []
        for pack in dmd.ZenPackManager.packs():
                try:
                        valid_packs.append(pack.id)
                except: 
                        pass

        # iterate over all packs, if missing from valid packs, remove:
        for pack_id in all_pack_ids:
                if pack_id not in valid_pack_ids:
                        print "Forced removal of %s" % pack_id
                        del packs._objects[pack_id]
        commit()