#!/bin/sh
set -e

FILE="/usr/share/nginx/html/index.html"

if grep -q "agendaos-sofia-mobile-live-fix" "$FILE"; then
  echo "El ajuste móvil de sofIA ya estaba aplicado."
  nginx -s reload
  exit 0
fi

sed -i 's#</style>#\n    /* agendaos-sofia-mobile-live-fix */\n    @media (max-width: 640px) {\n      #sofia {\n        padding-top: 3rem !important;\n        padding-bottom: 3rem !important;\n      }\n\n      #sofia > div {\n        display: block !important;\n        padding: 1rem !important;\n        border-radius: 1.75rem !important;\n      }\n\n      #sofia h2 {\n        font-size: 2.15rem !important;\n        line-height: 1.05 !important;\n      }\n\n      #sofia p {\n        font-size: .95rem !important;\n        line-height: 1.65rem !important;\n      }\n\n      #sofia .grid.gap-3.sm\\:grid-cols-2 {\n        display: none !important;\n      }\n\n      #sofia .mt-8.rounded-\\[2rem\\] {\n        margin-top: 1.25rem !important;\n        padding: 1rem !important;\n        border-radius: 1.35rem !important;\n      }\n\n      #sofia .card-hover {\n        margin-top: 1.5rem !important;\n        border-radius: 1.75rem !important;\n        padding: .85rem !important;\n        transform: none !important;\n      }\n\n      #sofia .card-hover:hover {\n        transform: none !important;\n      }\n\n      #sofia .mb-5.flex.items-center.justify-between {\n        align-items: flex-start !important;\n        gap: .75rem !important;\n      }\n\n      #sofia .h-16.w-16 {\n        height: 3rem !important;\n        width: 3rem !important;\n      }\n\n      #sofia .text-2xl {\n        font-size: 1.35rem !important;\n        line-height: 1.7rem !important;\n      }\n\n      #sofia .text-sm {\n        font-size: .78rem !important;\n        line-height: 1.25rem !important;\n      }\n\n      #sofia #chatMessages {\n        min-height: 285px !important;\n        max-height: 285px !important;\n        border-radius: 1.35rem !important;\n        padding: .75rem !important;\n      }\n\n      #sofia #chatMessages .max-w-\\[86\\%\\] {\n        max-width: 92% !important;\n      }\n\n      #sofia #chatMessages .px-5 {\n        padding-left: .9rem !important;\n        padding-right: .9rem !important;\n      }\n\n      #sofia #chatMessages .py-4 {\n        padding-top: .75rem !important;\n        padding-bottom: .75rem !important;\n      }\n\n      #sofia #sofiaForm {\n        display: grid !important;\n        grid-template-columns: 1fr !important;\n        gap: .65rem !important;\n      }\n\n      #sofia #sofiaInput {\n        width: 100% !important;\n        padding: .9rem 1rem !important;\n        font-size: .9rem !important;\n      }\n\n      #sofia #sofiaSend {\n        width: 100% !important;\n        padding: .9rem 1rem !important;\n      }\n\n      #sofia .rounded-full.border.border-emerald-300\\/20 {\n        padding: .45rem .75rem !important;\n        font-size: .68rem !important;\n      }\n\n      #sofia .mt-5.border-t {\n        margin-top: 1rem !important;\n        padding-top: .85rem !important;\n      }\n    }\n  </style>#' "$FILE"

nginx -s reload

echo "Ajuste móvil de sofIA en vivo aplicado."
