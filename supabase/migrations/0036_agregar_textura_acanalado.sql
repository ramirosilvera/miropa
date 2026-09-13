-- Consejo -- sweaters acanalados (rib knit) azul marino/beige, pedido
-- explícito del usuario con foto real de dos prendas propias. Ver el
-- comentario largo de "acanalado" en el enum Textura (types.ts) para la
-- justificación textil completa (construcción de punto real y distinta,
-- no una fibra nueva).
--
-- Aplicada en la MISMA ronda que agrega el valor al código (a diferencia
-- del hueco real encontrado en la ronda anterior con "zapatilla_cuero",
-- donde el código y el catálogo se adelantaron a esta migración y rompían
-- el insert real -- ver 0035): el código, el catálogo y este constraint
-- quedan sincronizados desde el mismo commit.
alter table armario.prendas drop constraint prendas_textura_check;
alter table armario.prendas add constraint prendas_textura_check
  check (textura in
    ('algodon','seda','cuero_liso','lino','lana','pana','corderoy','tejido_grueso','frisado','denim','acolchado','poliester','viscosa','impermeable','tricot','gabardina','acanalado') or textura is null);
