

# Don't delete this!!!!!!!!!


# Now I have a useful function, which is the dictionary (omit blood)
R_structure_to_dictionary <- function()
{
  new <- c()
  for (i in 1:100)    # now I have problem of naming 100 things
  {
    name_key <- toString(i)
    new <- c(new, name_key)
  }
  return (new)
}
R_structure_to_dictionary()

