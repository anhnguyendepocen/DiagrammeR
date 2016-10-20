# Function to take a graph object and labels for `from`
# and `to` values, and, translate the `from`/`to` label
# values to node ID values
translate_to_node_id <- function(graph, from, to) {

  # Check that node labels are unique
  if (length(unique(graph$nodes_df$label)) !=
      node_count(graph)) {
    stop("You cannot use labels to form edges because they are not distinct")
  }

  # No node labels can be empty
  if (any(graph$nodes_df$label == "")) {
    stop("You cannot use labels to form edges if there are empty strings for labels")
  }

  # Create the `from_id` and `to_id` vectors
  from_id <- vector("integer")
  to_id <- vector("integer")

  # Get an ordered vector of node ID values
  # as `from` nodes
  for (i in 1:length(from)) {
    from_id <-
      c(from_id,
        graph$nodes_df[
          which(graph$nodes_df$label %in% from[i]), 1])
  }

  # Get an ordered vector of node ID values
  # as `to` nodes
  for (i in 1:length(to)) {
    to_id <-
      c(to_id,
        graph$nodes_df[
          which(graph$nodes_df$label %in% to[i]), 1])
  }

  # Reassign these nodes back to `from` and `to`
  from <- from_id
  to <- to_id

  id_from_to <- list(from = from_id, to = to_id)

  return(id_from_to)
}