-- This was an attempt at the p4 free graph structure theorem.
-- import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Combinatorics.SimpleGraph.Subgraph
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Data.Fintype.Card

#check SimpleGraph
#check SimpleGraph.singletonSubgraph
#check SimpleGraph.Subgraph
#check SimpleGraph.Subgraph.IsInduced



--  prove: P4 free graphs structure theorem:
-- (Corneil, Lerchs, Burlingham, 1981): Let G be a graph.
--       Then G is a p4-free graph if and only if one of the following hold:
--        · |V(G)| = 1
--        · There exist two p4 free graphs, H and H' such that G is the disjoint union of these two graphs
--        · There exist two p4 free graphs, H and H' such that G is the graph obtained from the disjoint union
--              of these two graphs, by adding all possible edges between V(H) and V(H')

-- equivalently: G is a p_4 free graph if and only if for every induced subgraph H of G, either |V(H)| = 1 or
--     V(H) can be partitioned into two sets A, B such that A is either complete or anticomplete to B

-- An attempt at defining what a p4 graph is:
def isP4 (G : SimpleGraph α) :=
  ∃ (v1 v2 v3 v4 : α),
  G.Adj v1 v2 ∧  G.Adj v2 v3 ∧  G.Adj v3 v4
  ∧ ¬ (G.Adj v1 v3) ∧ ¬ (G.Adj v1 v4) ∧ ¬ (G.Adj v2 v4)
  -- another attempt below at what p4 could be defined as:
    -- (v1, v2) ∈ G.edgeSet ∧
    -- (v2, v3) ∈ G.edgeSet ∧
    -- (v3, v4) ∈ G.edgeSet ∧
    -- ¬ ((v1, v3) ∈ G.edgeSet) ∧
    -- ¬ ((v2, v4) ∈ G.edgeSet) ∧
    -- ¬ ((v1, v4) ∈ G.edgeSet)

#check isP4

-- defining p4 helps us define p4-free graphs (attempt):
def isP4Free (G: SimpleGraph α ) :=
  ¬ (isP4 G)


-- theorem p4_free {α : Type*} [DecidableEq α] (G : SimpleGraph α) :
--   (isP4Free G ↔ ∀ (H: SimpleGraph.Subgraph G), (SimpleGraph.Subgraph.IsInduced H) →
--          H.verts.toFinset_card = 1 ∨ ∃ (A B : Finset α), H.verts = A ∪ B ∧ (completeOrAnticomplete A B)) )) := by
--            sorry

-- we would have to define the relation of CompleteOrAnticComplete
