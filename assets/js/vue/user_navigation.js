
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

// import the router
import { useRouter } from 'vue-router'

const userNavigation = [
    { name: 'My Profile', href: '#/profile' },
    { name: 'Help & Feedback', href: '#/help' },
    { name: 'Log out', href: '#/logout' },
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
    },
    props: {
        context: {
            type: String,
            required: true,
            default: "user"
        }
    },
    methods: {
        http_req(url) {
            console.log(url);
            // check if the url is a logout
            if (url == "#/logout") {
                const router = useRouter()
                fetch('/users/log_out', {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': document.querySelector("meta[name='csrf-token']").getAttribute("content")
                    },
                    credentials: 'same-origin',
                }).then(response => {
                    window.location.href = "/"
                })
            }
        }
    },
    setup() {
        return {
            userNavigation
        }
    },
    template: `
    <div class="ml-4 flex items-center md:ml-6">
        <a v-if="this.context!='admin'" href="/admin" class="rounded bg-red-800 px-3 p-1 mx-3 text-white ">
        Admin Section
        </a>
        <Menu as="div" class="ml-3 relative">
          <div>
            <MenuButton class="max-w-xs bg-white flex items-center text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-emerald-300">
              <span class="sr-only">Open user menu</span>
              <img class="h-8 w-8 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="" />
            </MenuButton>
          </div>
          <transition enter-active-class="transition ease-out duration-100" enter-from-class="transform opacity-0 scale-95" enter-to-class="transform opacity-100 scale-100" leave-active-class="transition ease-in duration-75" leave-from-class="transform opacity-100 scale-100" leave-to-class="transform opacity-0 scale-95">
            <MenuItems class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none">
              <MenuItem v-for="item in userNavigation" :key="item.name" v-slot="{ active }">
                <button @click="this.http_req(item.href)" :class="[active ? 'bg-gray-100' : '', 'block px-4 py-2 text-sm text-gray-700 hover:no-underline w-full']">{{ item.name }}</button>
              </MenuItem>
            </MenuItems>
          </transition>
        </Menu>
      </div>`
}