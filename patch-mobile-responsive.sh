#!/bin/sh
set -e

FILE="/usr/share/nginx/html/index.html"

# Evita duplicar el fix si ya existe
if grep -q "agendaos-current-mobile-responsive-fix" "$FILE"; then
  echo "El ajuste responsive mobile ya estaba aplicado."
  nginx -s reload
  exit 0
fi

# Inserta CSS responsive antes del cierre de </style>. No cambia HTML, diseño desktop ni banner.
sed -i 's#</style>#\n    /* agendaos-current-mobile-responsive-fix */\n    @media (max-width: 640px) {\n      section:first-of-type {\n        padding-top: 2.25rem !important;\n        padding-bottom: 3rem !important;\n      }\n\n      section:first-of-type h1 {\n        font-size: 3rem !important;\n        line-height: .95 !important;\n      }\n\n      section:first-of-type p {\n        font-size: 1rem !important;\n        line-height: 1.75rem !important;\n      }\n\n      section:first-of-type .mt-14.grid.gap-4.sm\\:grid-cols-3 {\n        display: none !important;\n      }\n\n      section:first-of-type img[class*=\"h-[680px]\"] {\n        height: 500px !important;\n      }\n\n      section:first-of-type .rounded-\\[2\\.8rem\\] {\n        border-radius: 2rem !important;\n      }\n\n      section:first-of-type .rounded-\\[2\\.2rem\\] {\n        border-radius: 1.5rem !important;\n        padding: 1rem !important;\n      }\n\n      section:first-of-type .absolute.inset-0.flex.flex-col.justify-between {\n        padding: 1rem !important;\n      }\n\n      section:first-of-type .h-16.w-16 {\n        height: 3rem !important;\n        width: 3rem !important;\n      }\n\n      section:first-of-type .text-4xl {\n        font-size: 1.75rem !important;\n        line-height: 2rem !important;\n      }\n\n      section:first-of-type .text-2xl {\n        font-size: 1.15rem !important;\n        line-height: 1.5rem !important;\n      }\n\n      section:first-of-type .p-5,\n      section:first-of-type .p-6,\n      section:first-of-type .p-7 {\n        padding: 1rem !important;\n      }\n\n      section:first-of-type .grid.gap-3.sm\\:grid-cols-2,\n      section:first-of-type .grid.gap-3.sm\\:grid-cols-3 {\n        grid-template-columns: 1fr !important;\n      }\n\n      section:first-of-type .rounded-2xl {\n        border-radius: 1rem !important;\n      }\n    }\n  </style>#' "$FILE"

nginx -s reload

echo "Ajuste responsive móvil aplicado sin cambiar banner ni diseño desktop."
