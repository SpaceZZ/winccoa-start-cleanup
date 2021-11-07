// $License: MIT
//--------------------------------------------------------------------------------
/**
  @file clean_standard_dpt.ctl
  @copyright MIT
  @author SpaceZ

  Script cleans all of the standard Dpts and Dps coming by default with any new project.
  Function removeDpt runs 2 times, because some of the existing dps have dp_fct and it doesnt like removing those.
*/

//--------------------------------------------------------------------------------
// Libraries used (#uses)

//--------------------------------------------------------------------------------
// Variables and Constants

//--------------------------------------------------------------------------------
/**
*/
main()
{
  DebugTN("Started");
  removeDpt();
  removeDpt();
  DebugTN("Finished");
}

// removes Dpts
void removeDpt()
{
  dyn_string existingDpts;

  existingDpts = dpTypes("*");

  for(int i=1; i <= existingDpts.count();i++)
  {
    string dpt = existingDpts[i];
    if(!dpt.startsWith("_"))
    {
      deleteDp(dpt);
    }
  }
}

// deletes all dps in the dpt
void deleteDp(string dpt)
{
  dyn_string dps = dpNames("*", dpt);

  for(int i=1; i <= dps.count();i++)
  {
    DebugTN("Deleting dp:", dps[i]);
    dpDelete(dps[i]);
  }

  DebugTN("Delete dpt:", dpt);
  dpTypeDelete(dpt);
}
