// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = {
  content: [
    "./js/**/*.{vue,js}",
    "../lib/madeni_web.ex",
    "../lib/madeni_web/**/*.*ex"
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: [
          'Inter',
          'system-ui',
          '-apple-system',
          'BlinkMacSystemFont',
          '"Segoe UI"',
          'Roboto',
          '"Helvetica Neue"',
          'Arial',
          '"Noto Sans"',
          'sans-serif',
          '"Apple Color Emoji"',
          '"Segoe UI Emoji"',
          '"Segoe UI Symbol"',
          '"Noto Color Emoji"',
        ],
      },
      colors: {
        'coolgray': {
          '50': '#F3F4F6',
          '100': '#D1D5DB',
          '200': '#6B7280',
          '300': '#374151',
          '400': '#1F2937',
          '500': '#111827',
        },
        'warmgray': {
          '50': '#F6F6F3',
          '100': '#F1F0ED',
          '200': '#EDECE9',
          '300': '#DEE1DA',
          '400': '#D3D6CE',
          '500': '#A9B1A9',
        },
        'emerald': {
          '50': '#000000',
          '100': '#000000',
          '200': '#000000',
          '300': '#000000',
          '400': '#000000',
          '500': '#000000',
          '600': '#000000'
        },
        'teal': {
          '50': '#CCFBF1',
          '100': '#99F6E4',
          '200': '#5EEAD4',
          '300': '#4EACB1',
          '400': '#008C8E',
          '500': '#134E4A',
        },
        'amber': {
          '50': '#FCF6E0',
          '100': '#FDE68A',
          '200': '#FBBF24',
          '300': '#F59E0B',
          '400': '#D97706',
          '500': '#92400E',
        },
        'red': {
          '50': '#FEF2F2',
          '100': '#FEE2E2',
          '200': '#FCA5A5',
          '300': '#EF4444',
          '400': '#B91C1C',
          '500': '#3E39D1',
        },
        'mzoori-10': "#000000", // Auth form header
        'mzoori-20': "#000000", // Dashboard sidebar
        'mzoori-30': "#000000", // Profile pic placeholder
        'mzoori-40': "#000000", // Editable table row Hover
      },
      screens: {
        xs: '375px',
        xxl: '1410px',
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({ addVariant }) => addVariant("phx-no-feedback", [".phx-no-feedback&", ".phx-no-feedback &"])),
    plugin(({ addVariant }) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({ addVariant }) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({ addVariant }) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function ({ matchComponents, theme }) {
      let iconsDir = path.join(__dirname, "../deps/heroicons/optimized")
      let values = {}
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
        ["-micro", "/16/solid"]
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
          let name = path.basename(file, ".svg") + suffix
          values[name] = { name, fullPath: path.join(iconsDir, dir, file) }
        })
      })
      matchComponents({
        "hero": ({ name, fullPath }) => {
          let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
          let size = theme("spacing.6")
          if (name.endsWith("-mini")) {
            size = theme("spacing.5")
          } else if (name.endsWith("-micro")) {
            size = theme("spacing.4")
          }
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            "-webkit-mask": `var(--hero-${name})`,
            "mask": `var(--hero-${name})`,
            "mask-repeat": "no-repeat",
            "background-color": "currentColor",
            "vertical-align": "middle",
            "display": "inline-block",
            "width": size,
            "height": size
          }
        }
      }, { values })
    })
  ]
}
