function [g, e, elecparam, calciump] = loadglobal
    global CONDUCTANCES REVPOTS ELECPARAM CALCIUMP
    g = CONDUCTANCES;
    e = REVPOTS;
    elecparam = ELECPARAM;
    calciump = CALCIUMP;
end