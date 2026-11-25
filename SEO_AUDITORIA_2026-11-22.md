# Auditoria SEO — Morar Ipanema (22/11/2026)

## Fontes verificadas

- DNS Cloudflare aponta `moraremipanema.com` e `www.moraremipanema.com` para projeto Pages `moraremipanema-site-direct`.
- Publicação Cloudflare Pages de 21/11/2026 informa status `success`.
- Sitemap **efetivamente servido** em `https://www.moraremipanema.com/sitemap.xml` relaciona apenas `/`, `/galeria` e `/videos`.
- Regra de resposta da Cloudflare adiciona `X-Robots-Tag: noindex, follow` em `/videos`.
- Este repositório inclui dezenas de páginas HTML e outro sitemap com URLs `.html`, e pode ser uma versão anterior ou paralela. Não assumir que está sincronizado com o Pages em produção.
- `index.html` deste repositório já contém canonical, Open Graph, meta description, RealEstateListing, Offer e Apartment; revisar dados antes de reutilizar. O campo `dateModified` indica 2026-10-08 (desatualizado). O anúncio contém número de banheiros e custos que requerem checagem contra o imóvel atual.

## Prioridade P0 — Antes de qualquer publicação

1. Recuperar fonte integral do deploy `moraremipanema-site-direct` e identificar mecanismo de publicação (Direct Upload). Não substituir o projeto pelo conteúdo do GitHub sem conferência: risco de remover fotos, rotas e recursos.
2. Conferir HTML, recursos, canonical, status HTTP, robots.txt e sitemap da **produção**, incluindo diferenças entre `/galeria` e `/gallery`.
3. Resolver contradição: `/videos` consta no sitemap servido, mas a Cloudflare envia `noindex`. Se for página indexável, retirar o cabeçalho; se não, remover do sitemap.
4. Confirmar com o proprietário dados factuais antes de divulgar: 4 quartos, 300 m², 2 vagas, preço R$ 6.500.000, 4 banheiros mais lavabo e dependência; o JSON-LD deste repositório afirma 3 banheiros completos + 1 lavabo, o que exige revisão.

## Prioridade P1 — SEO e descoberta

- Meta title sugerido: `Apartamento à Venda em Ipanema | 300 m² e 4 Quartos`.
- Meta description sugerida: `Apartamento de luxo à venda em Ipanema, com 300 m², 4 quartos, 2 vagas, vista lateral para o mar e porteira fechada. Venda direta por R$ 6,5 milhões.`
- Robots: permitir rastreamento das páginas públicas; evitar bloquear Googlebot e Bingbot. Atenção a regras anti-bot e AI crawler no painel da Cloudflare.
- Manter sitemap somente com páginas canônicas que retornem 200 e permitam indexação, sem data fictícia `lastmod`.
- Garantir uma URL canônica https://www.moraremipanema.com/ em links, metadata e dados estruturados.
- Search Console: propriedade de domínio possui TXT DNS presente; indexação real deve ser conferida dentro da ferramenta. Enviar URL do sitemap.
- Bing Webmaster Tools: importar a propriedade do Search Console ou verificar a posse; enviar sitemap.
- AI search: permitir acessos dos crawlers de busca aplicáveis e criar conteúdo factual claro; **não** prometer inclusão nas respostas das IAs.
- Distribuição: listar portais imobiliários confiáveis e referências externas reais; evitar geração artificial de backlinks.

## Observação operacional

O projeto Cloudflare Pages atual está baseado em Direct Upload; commits no GitHub não atualizam automaticamente a versão no ar. Publicação de mudanças somente após obter e validar todos os arquivos da versão de produção.
