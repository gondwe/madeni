import { ref } from 'vue'
import userNavigation from './user_navigation.js'
import {
  Dialog,
  DialogOverlay,
  Menu,
  MenuButton,
  MenuItem,
  MenuItems,
  TransitionChild,
  TransitionRoot,
} from '@headlessui/vue'
import {
  BellIcon,
  LocationMarkerIcon,
  GiftIcon,
  ShoppingBagIcon,
  ReceiptTaxIcon,
  CalendarIcon,
  ChartBarIcon,
  DocumentIcon,
  CogIcon,
  MinusSmIcon,
  HomeIcon,
  InboxIcon,
  MenuAlt2Icon,
  UsersIcon,
  XIcon,
} from '../../node_modules/@heroicons/vue/outline'

import { SearchIcon } from '../../node_modules/@heroicons/vue/solid'

const adminNavigation = [
  { name: 'Dashboard', href: '/admin', icon: HomeIcon, current: true },
  { name: 'Products', href: '/admin/products', icon: UsersIcon, current: false },
  { name: 'Loans', href: '/admin/user_loans', icon: GiftIcon, current: false },
  { name: 'Loan Types', href: '/admin/loan_types', icon: UsersIcon, current: false },
  { name: 'Payment Methods', href: '/admin/payment_methods', icon: UsersIcon, current: false },
  { name: 'Loan Products', href: '/admin/loan_products', icon: UsersIcon, current: false },
  { name: 'Repayments', href: '/admin/loan_payments', icon: UsersIcon, current: false },
  { name: 'Users', href: '/admin/users', icon: UsersIcon, current: false },
]

const frontNavigation = [
  { name: 'Home', href: '/#/home', icon: HomeIcon, current: true },
  { name: 'Products', href: '/loan_products', icon: GiftIcon, current: false },
  { name: 'Settings', href: '/users/settings', icon: UsersIcon, current: false },
]



export default {
  components: {
    Dialog,
    DialogOverlay,
    Menu,
    MenuButton,
    MenuItem,
    MenuItems,
    TransitionChild,
    TransitionRoot,
    BellIcon,
    MenuAlt2Icon,
    SearchIcon,
    XIcon,
    userNavigation,
  },
  props: {
    user: {
      type: Object,
      required: true
    },
    context: {
      type: String,
      required: true,
      default: "user"
    }
  },
  methods: {
    navigation(ctx) {
      return ctx == "user" ? this.frontNavigation : this.adminNavigation
    }
  },
  setup() {
    const sidebarOpen = ref(false)

    return {
      frontNavigation,
      adminNavigation,
      sidebarOpen,
      navigation: function (ctx) {
        return ctx == "user" ? this.frontNavigation : this.adminNavigation
      }
    }
  },
  template: `<div class="bg-coolgray-10 min-h-full ">
  <TransitionRoot as="template" :show="sidebarOpen">
    <Dialog as="div" class="fixed inset-0 flex z-40 md:hidden" @close="sidebarOpen = false">
      <TransitionChild as="template" enter="transition-opacity ease-linear duration-300" enter-from="opacity-0" enter-to="opacity-100" leave="transition-opacity ease-linear duration-300" leave-from="opacity-100" leave-to="opacity-0">
        <DialogOverlay class="fixed inset-0 bg-gray-600 bg-opacity-75" />
      </TransitionChild>
      <TransitionChild as="template" enter="transition ease-in-out duration-300 transform" enter-from="-translate-x-full" enter-to="translate-x-0" leave="transition ease-in-out duration-300 transform" leave-from="translate-x-0" leave-to="-translate-x-full">
        <div class="relative flex-1 flex flex-col max-w-xs w-full pt-5 pb-4 bg-mzoori-20">
          <TransitionChild as="template" enter="ease-in-out duration-300" enter-from="opacity-0" enter-to="opacity-100" leave="ease-in-out duration-300" leave-from="opacity-100" leave-to="opacity-0">
            <div class="absolute top-0 right-0 -mr-12 pt-2">
              <button type="button" class="ml-1 flex items-center justify-center h-10 w-10 rounded-full focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" @click="sidebarOpen = false">
                <span class="sr-only">Close sidebar</span>
                <XIcon class="h-6 w-6 text-white" aria-hidden="true" />
              </button>
            </div>
          </TransitionChild>
          <div class="flex-shrink-0 flex items-center px-4 text-center text-gray-300 text-3xl">
            X LOGO
          </div>
          <div class="mt-5 flex-1 h-0 overflow-y-auto">
            <nav class="px-2 space-y-1">
              <a v-for="item in navigation(this.context)" :key="item.name" :href="item.href" :class="[item.current ? 'bg-red-500 text-white' : 'text-white hover:no-underline hover:bg-red-400', 'group flex items-center px-2 py-2 text-base font-medium rounded-md']">
                <component :is="item.icon" class="mr-4 flex-shrink-0 h-6 w-6 text-white" aria-hidden="true" />
                {{ item.name }}
              </a>
            </nav>
          </div>
        </div>
      </TransitionChild>
      <div class="flex-shrink-0 w-14" aria-hidden="true">
        <!-- Dummy element to force sidebar to shrink to fit close icon -->
      </div>
    </Dialog>
  </TransitionRoot>

  <!-- Static sidebar for desktop -->
  <div class="hidden md:flex md:w-64 md:flex-col md:fixed md:inset-y-0">
    <!-- Sidebar component, swap this element with another sidebar if you like -->
    <div class="flex flex-col flex-grow pt-5 bg-mzoori-20 overflow-y-auto">
      <div class="flex items-center flex-shrink-0 px-4 text-center text-gray-300 text-3xl">
        X LOGO
      </div>
      <div class="mt-7 flex-1 flex flex-col">
        <nav class="flex-1 px-2 pb-4 space-y-5">
          <template v-for="item in navigation(this.context)" :key="item.name">
            <div v-if="!item.children">
              <a :href="item.href" :class="[item.current ? 'bg-red-500 text-white' : 'text-white hover:no-underline hover:bg-red-400', 'group flex items-center px-2 py-2 text-sm font-medium rounded-md']">
                <component :is="item.icon" class="mr-3 flex-shrink-0 h-6 w-6 text-white" aria-hidden="true" />
                {{ item.name }}
              </a>
            </div>
            <div v-else class="space-y-1">
              <p :class="[item.current ? 'bg-teal-500 text-white' : 'text-white hover:no-underline', 'group w-full flex items-center px-2 py-2 text-sm font-medium rounded-md']">
                <component :is="item.icon" class="mr-3 flex-shrink-0 h-6 w-6 text-white" aria-hidden="true" />
                <span class="flex-1">
                  <span class="flex-1">
                  {{ item.name }}
                  </span>
                  <span v-if="item.count" :class="[item.current ? 'bg-white' : 'bg-gray-100 group-hover:bg-gray-200', 'ml-3 inline-block py-0.5 px-3 text-xs font-medium rounded-full']">
                    {{ item.count }}
                  </span>
                </span>
              </p>
              <div class="space-y-1">
                <a v-for="subItem in item.children" :key="subItem.name" as="a" :href="subItem.href" class="group w-full flex items-center pl-11 pr-2 py-2 text-sm font-medium text-gray-300 hover:no-underline hover:bg-teal-400 hover:text-white">
                  <span class="flex-1">
                  {{ subItem.name }}
                  </span>
                  <span v-if="subItem.count" class="bg-amber-400 text-white ml-3 inline-block py-0.5 px-3 text-xs font-medium rounded-full">
                    {{ subItem.count }}
                  </span>
                </a>
              </div>
            </div>
          </template>
        </nav>
      </div>
    </div>
  </div>
  <div class="md:pl-64 flex flex-col flex-1">
    <div class="sticky top-0 z-10 flex-shrink-0 flex h-16 bg-white shadow">
      <button type="button" class="px-4 border-r border-gray-200 text-gray-500 hover:no-underline focus:outline-none focus:ring-2 focus:ring-inset focus:ring-emerald-300 md:hidden" @click="sidebarOpen = true">
        <span class="sr-only">Open sidebar</span>
        <span class="hero-arrow-left-solid">Open sidebar</span>
        <MenuAlt2Icon class="h-6 w-6" aria-hidden="false" />
      </button>
      <div class="flex-1 px-4 flex justify-end">
      <!-- Profile dropdown -->
      <userNavigation :context="context" :user="user"></userNavigation>
      </div>
    </div>

    <main class="pb-12">
      
    </main>
  </div>
</div>`
};
// </script >