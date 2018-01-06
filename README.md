# FaceMorphing
Matlab Computational Photography
https://photography-assign.appspot.com/morphing.php

Eleven   matlab   files   are   used
- morphing_starter.m
- correspondences.m - tridel.m
- morphed_im.m
- warp.m
- mytsearch.m
- computeAffine.m
- outofbounds.m
- meanface.m
- meanfaceTransfo.m - averageTransfo.m

To   run   the   code,   you   need   to   open   and   run   the   morphing_starter.m   file.
The   code   needs   pictures   of   the   same   size   to   work.   For   that,   two   students   images   (amandine.jpg
and   stas.jpg   have   been   resized   to   1600x1200   like   the   others   images).
The   images   used   in   the   assignment   is   already   in   the   code   (amandine.jpg   and   branson.jpg).   To change   it   for   another   image   (more   images   are   available   in   the   images/students   folder),   change the   code   at   line   4   &   5   of   mophing_starter.m,   make   sure   to   change   the   name   correspondingly   on line   7,   8   &   9   to   fit   the   firstname   of   the   person.

The   code   to   save   the   outputs   images   and   video   or   print   the   figures   have   been   commented
When   needed   (morph,   mean   face   transformation   and   average   transformations)   if   the corresponding   points   between   the   two   images   already   exists   (either   .mat   or   .txt),   the   cpselect tool   will   open   them   directly.   Once   opened   the   user   can   add/remove   or   adjust   the   points.   If   the corresponding   points   do   not   already   exist,   the   user   will   have   to   defined   them   in   the   cpselect   tool.

The   corresponding   points   are   the   only   user   inputs   needed.   The   program   will   run   the   code   for   the morph   sequence,   the   mean   face   computation,   the   mean   face   transformations   and   then   the average   face   transformations.
The   user   should   be   able   to   see   through   messages   in   the   console   the   current   step   being computed.
The   outputs   will   be   located   in   the   video   folder   (as   an   .avi)   and:
- images/outputs/morphed   folder   for   the   morphing   sequence
- images/outputs/meanface   folder   for   the   mean   face   computation   and   transformations
- images/outputs/averages   folder   for   the   average   faces   transformations

The   folder   points   contains   the   differents   points   in   differents   formats   (.mat   or   .txt),   defined   by myself   or   the   other   students.
The   folder   images   also   contains:
- students   folder   for   the   original   pictures
- studentspts   folder   the   pictures   with   the   points
- average   folder   for   the   average   face   from   online
- triangulations   folder   for   the   outputs   triangulation   of   the   code
