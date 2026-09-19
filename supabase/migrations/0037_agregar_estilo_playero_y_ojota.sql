-- Consejo -- nuevo estilo "playero" y nuevo corte de calzado "ojota",
-- pedido explícito del usuario con fotos reales de 7 prendas propias (3
-- remeras cuello V texturizadas, 3 shorts de baño estampados, 1 ojota
-- azul marino). Ver "playero" en Estilo y "ojota" en CorteCalzado
-- (site/src/lib/types.ts) para la justificación completa (roles: asesor
-- de imagen, sastre).
--
-- Tres constraints, no dos -- a diferencia de la migración 0036
-- (acanalado), acá hay que tocar también `estilos_secundarios` (el
-- array), no solo `estilo`: las 7 prendas nuevas cargan "casual" como
-- secundario, pero cualquier prenda futura podría querer "playero" como
-- secundario también, y el constraint del array es independiente del de
-- la columna simple.
alter table armario.prendas drop constraint prendas_estilo_check;
alter table armario.prendas add constraint prendas_estilo_check
  check ((estilo = any (array['casual','formal','deportivo','urbano','clasico','oficina','playero'])) or estilo is null);

alter table armario.prendas drop constraint prendas_estilos_secundarios_check;
alter table armario.prendas add constraint prendas_estilos_secundarios_check
  check (estilos_secundarios <@ array['casual','formal','deportivo','urbano','clasico','oficina','playero']);

alter table armario.prendas drop constraint prendas_corte_calzado_check;
alter table armario.prendas add constraint prendas_corte_calzado_check
  check (corte_calzado in ('zapatilla_urbana','zapatilla_running','zapato_vestir','mocasin','zapatilla_cuero','zapatilla_lona','botin','sandalia','ojota'));
