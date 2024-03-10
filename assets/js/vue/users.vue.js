import { ref } from "vue";
import {
  Dialog,
  DialogOverlay,
  TransitionChild,
  TransitionRoot,
  Listbox,
  ListboxButton,
  ListboxLabel,
  ListboxOption,
  ListboxOptions,
} from "@headlessui/vue";

import { CheckIcon, ChevronDownIcon } from "@heroicons/vue/solid";

const people = [
  {
    name: "Joseph Abuya Oiroka",
    id: "26475757",
    phone: "254713425363",
    email: "abuya.obuya@gmai.com",
    outlet: "Abby Mart Mini",
    role: "Cashier",
    status: "Active",
  },
  // More people...
];

const roles = [
  { id: 0, name: "Filter By Role" },
  { id: 1, name: "Cashier" },
  { id: 2, name: "Loans Manager" },
  { id: 3, name: "Stock Manager" },
];

const status = [
  { id: 0, name: "Filter By Status" },
  { id: 1, name: "Active" },
  { id: 2, name: "Inactive" },
];

export default {
  // name: "Users",
  components: {
    Dialog,
    DialogOverlay,
    TransitionChild,
    TransitionRoot,
    Listbox,
    ListboxButton,
    ListboxLabel,
    ListboxOption,
    ListboxOptions,
    CheckIcon,
    ChevronDownIcon,
  },

  setup() {
    const addUserModal = ref(false);
    const role = ref(roles[0]);
    const statas = ref(status[0]);


    return {
      people,
      addUserModal,
      role,
      roles,
      statas,
      status,
    };
  },
  template: `
    <div class="py-6">
      <div>
        <div class="pb-5 border-b border-gray-200 mb-5">
          <div class="sm:flex sm:items-center sm:justify-between">
            <div class="mt-2 lg:flex-grow max-w-xs">
              <div class="mt-1 relative rounded-md">
                <div
                  class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-5 w-5 text-gray-400"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                    />
                  </svg>
                </div>
                <input
                  type="text"
                  name="search"
                  id="search"
                  class="mt-1 block w-full pl-10 user_dialog_input"
                  placeholder="Search"
                />
              </div>
            </div>
            <div
              class="mt-3 sm:flex items-center space-y-2 sm:space-y-0 sm:space-x-2 lg:mt-0 lg:flex-none"
            >
              <Listbox as="div" v-model="role">
                <div class="mt-1 relative">
                  <ListboxButton
                    class="bg-white relative w-full border border-gray-300 rounded-md shadow-sm pl-3 pr-10 py-2 text-left cursor-default focus:outline-none focus:ring-1 focus:ring-emerald-100 focus:border-emerald-50 sm:text-sm"
                  >
                    <span class="block truncate">{{ role.name }}</span>
                    <span
                      class="absolute inset-y-0 right-0 flex items-center pr-2 pointer-events-none"
                    >
                      <ChevronDownIcon
                        class="h-5 w-5 text-gray-400"
                        aria-hidden="true"
                      />
                    </span>
                  </ListboxButton>

                  <transition
                    leave-active-class="transition ease-in duration-100"
                    leave-from-class="opacity-100"
                    leave-to-class="opacity-0"
                  >
                    <ListboxOptions
                      class="absolute z-10 mt-1 w-full bg-white shadow-lg max-h-60 rounded-md py-1 text-base ring-1 ring-black ring-opacity-5 overflow-auto focus:outline-none sm:text-sm"
                    >
                      <ListboxOption
                        as="template"
                        v-for="role in roles"
                        :key="role.id"
                        :value="role"
                        v-slot="{ active, selected }"
                      >
                        <li
                          :class="[
                            active
                              ? 'text-white bg-emerald-600'
                              : 'text-gray-900',
                            'cursor-default select-none relative py-2 pl-3 pr-9',
                          ]"
                        >
                          <span
                            :class="[
                              selected ? 'font-semibold' : 'font-normal',
                              'block truncate',
                            ]"
                          >
                            {{ role.name }}
                          </span>

                          <span
                            v-if="selected"
                            :class="[
                              active ? 'text-white' : 'text-emerald-600',
                              'absolute inset-y-0 right-0 flex items-center pr-4',
                            ]"
                          >
                            <CheckIcon class="h-5 w-5" aria-hidden="true" />
                          </span>
                        </li>
                      </ListboxOption>
                    </ListboxOptions>
                  </transition>
                </div>
              </Listbox>

              <Listbox as="div" v-model="statas">
                <div class="mt-1 relative">
                  <ListboxButton
                    class="bg-white relative w-full border border-gray-300 rounded-md shadow-sm pl-3 pr-10 py-2 text-left cursor-default focus:outline-none focus:ring-1 focus:ring-emerald-100 focus:border-emerald-50 sm:text-sm"
                  >
                    <span class="block truncate">{{ statas.name }}</span>
                    <span
                      class="absolute inset-y-0 right-0 flex items-center pr-2 pointer-events-none"
                    >
                      <ChevronDownIcon
                        class="h-5 w-5 text-gray-400"
                        aria-hidden="true"
                      />
                    </span>
                  </ListboxButton>

                  <transition
                    leave-active-class="transition ease-in duration-100"
                    leave-from-class="opacity-100"
                    leave-to-class="opacity-0"
                  >
                    <ListboxOptions
                      class="absolute z-10 mt-1 w-full bg-white shadow-lg max-h-60 rounded-md py-1 text-base ring-1 ring-black ring-opacity-5 overflow-auto focus:outline-none sm:text-sm"
                    >
                      <ListboxOption
                        as="template"
                        v-for="person in status"
                        :key="person.id"
                        :value="person"
                        v-slot="{ active, selected }"
                      >
                        <li
                          :class="[
                            active
                              ? 'text-white bg-emerald-600'
                              : 'text-gray-900',
                            'cursor-default select-none relative py-2 pl-3 pr-9',
                          ]"
                        >
                          <span
                            :class="[
                              selected ? 'font-semibold' : 'font-normal',
                              'block truncate',
                            ]"
                          >
                            {{ person.name }}
                          </span>

                          <span
                            v-if="selected"
                            :class="[
                              active ? 'text-white' : 'text-emerald-600',
                              'absolute inset-y-0 right-0 flex items-center pr-4',
                            ]"
                          >
                            <CheckIcon class="h-5 w-5" aria-hidden="true" />
                          </span>
                        </li>
                      </ListboxOption>
                    </ListboxOptions>
                  </transition>
                </div>
              </Listbox>

             

              <a
                @click="addUserModal = true"
                class="btn btn-primary inline-flex items-center"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="-ml-0.5 mr-2 h-4 w-4"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M12 6v6m0 0v6m0-6h6m-6 0H6"
                  />
                </svg>
                Add User
              </a>
            </div>
          </div>
        </div>
      </div>

      <!-- table -->
      <div class="px-4 sm:px-0">
        <div>
          <div class="mt-8 flex flex-col">
            <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
              <div
                class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8"
              >
                <div
                  class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg"
                >
                  <table class="min-w-full divide-y divide-gray-300">
                    <thead class="bg-gray-50">
                      <tr>
                        <th
                          scope="col"
                          class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-700 sm:pl-6"
                        >
                          Name
                        </th>
                        <th
                          scope="col"
                          class="px-3 py-3.5 text-left text-sm font-semibold text-gray-700"
                        >
                          ID Number
                        </th>
                        <th
                          scope="col"
                          class="px-3 py-3.5 text-left text-sm font-semibold text-gray-700"
                        >
                          Phone Number
                        </th>
                        
                        <th
                          scope="col"
                          class="px-3 py-3.5 text-left text-sm font-semibold text-gray-700"
                        >
                          Status
                        </th>
                        <th
                          scope="col"
                          class="relative py-3.5 pl-3 pr-4 sm:pr-6"
                        >
                          <span class="sr-only">Actions</span>
                        </th>
                      </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200 bg-white">
                      <tr v-for="person in people" :key="person.email">
                        <td
                          class="whitespace-nowrap py-4 pl-4 pr-3 text-sm sm:pl-6"
                        >
                          {{ person.name }}
                        </td>
                        <td
                          class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"
                        >
                          {{ person.id }}
                        </td>
                        <td
                          class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"
                        >
                          {{ person.phone }}
                        </td>
                        
                        <td
                          class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"
                        >
                          <span
                            class="inline-flex rounded-full bg-green-100 px-2 text-xs font-semibold leading-5 text-green-800"
                            >{{ person.status }}</span
                          >
                        </td>
                        <td
                          class="relative whitespace-nowrap py-4 pl-3 pr-4 space-x-4 text-right text-sm font-medium sm:pr-6"
                        >
                          <a
                            href="#"
                            class="text-green-600 text-sm font-medium hover:text-green-900"
                            >View</a
                          >
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <TransitionRoot as="template" :show="addUserModal">
      <Dialog
        as="div"
        class="fixed z-10 inset-0 overflow-y-auto"
        @close="addUserModal = false"
      >
        <div
          class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0"
        >
          <TransitionChild
            as="template"
            enter="ease-out duration-300"
            enter-from="opacity-0"
            enter-to="opacity-100"
            leave="ease-in duration-200"
            leave-from="opacity-100"
            leave-to="opacity-0"
          >
            <DialogOverlay
              class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"
            />
          </TransitionChild>

          <!-- This element is to trick the browser into centering the modal contents. -->
          <span
            class="hidden sm:inline-block sm:align-middle sm:h-screen"
            aria-hidden="true"
            >&#8203;</span
          >
          <TransitionChild
            as="template"
            enter="ease-out duration-300"
            enter-from="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
            enter-to="opacity-100 translate-y-0 sm:scale-100"
            leave="ease-in duration-200"
            leave-from="opacity-100 translate-y-0 sm:scale-100"
            leave-to="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
          >
            <div
              class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-2xl w-full"
            >
              <form>
                <div
                  class="bg-white px-4 py-5 border-b border-gray-200 sm:px-6"
                >
                  <div class="flex items-center justify-between">
                    <p class="text-lg font-medium text-gray-500">Add User</p>
                    <div>
                      <button
                        type="button"
                        class="text-gray-400 hover:text-gray-900"
                        @click="addUserModal = false"
                      >
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          class="h-6 w-6"
                          fill="none"
                          viewBox="0 0 24 24"
                          stroke="currentColor"
                        >
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M6 18L18 6M6 6l12 12"
                          />
                        </svg>
                      </button>
                    </div>
                  </div>
                </div>
                <div class="px-4 py-5 bg-white sm:p-6">
                  <div class="grid grid-cols-6 gap-6">
                    <div class="col-span-6 sm:col-span-3">
                      <label
                        for="user-name"
                        class="block text-sm font-medium text-gray-700"
                      >
                        <span class="sr-only">user Name</span>
                      </label>
                      <input
                        type="text"
                        name="user-name"
                        id="user-name"
                        class="mt-1 user_dialog_input"
                        placeholder="Name"
                      />
                    </div>

                    <div class="col-span-6 sm:col-span-3">
                      <label
                        for="id-no"
                        class="block text-sm font-medium text-gray-700"
                      >
                        <span class="sr-only">ID Number</span>
                      </label>
                      <input
                        type="text"
                        name="id-no"
                        id="id-no"
                        class="mt-1 user_dialog_input"
                        placeholder="ID Number"
                      />
                    </div>

                    <div class="col-span-6 sm:col-span-3">
                      <label
                        for="email-address"
                        class="block text-sm font-medium text-gray-700"
                      >
                        <span class="sr-only">Email Address</span>
                      </label>
                      <input
                        type="email"
                        name="email-address"
                        id="email-address"
                        class="mt-1 user_dialog_input"
                        placeholder="Email"
                      />
                    </div>

                    <div class="col-span-6 sm:col-span-3">
                      <label
                        for="phone-no"
                        class="block text-sm font-medium text-gray-700"
                      >
                        <span class="sr-only">ID Number</span>
                      </label>
                      <input
                        type="tel"
                        name="phone-no"
                        id="phone-no"
                        class="mt-1 user_dialog_input"
                        placeholder="Phone Number"
                      />
                    </div>

                    <div class="col-span-6 sm:col-span-3">
                      <label
                        for="outlet"
                        class="block text-sm font-medium text-gray-700"
                      >
                        <span class="sr-only">Select Location On Map</span>
                      </label>
                      <input
                        type="text"
                        name="outlet"
                        id="outlet"
                        class="mt-1 user_dialog_input"
                        placeholder="Outlet"
                      />
                    </div>

                    <div class="col-span-6 sm:col-span-3">
                      <label
                        for="role"
                        class="block text-sm font-medium text-gray-700"
                      >
                        <span class="sr-only">Select Location On Map</span>
                      </label>
                      <input
                        type="text"
                        name="role"
                        id="role"
                        class="mt-1 user_dialog_input"
                        placeholder="Role"
                      />
                    </div>
                  </div>
                </div>
                <div class="px-4 py-3 bg-gray-50 sm:px-6">
                  <div class="flex justify-end space-x-2">
                    <button
                      type="submit"
                      class="btn btn-caution"
                      @click="addUserModal = false"
                    >
                      Cancel
                    </button>
                    <button type="submit" class="btn btn-primary">Save</button>
                  </div>
                </div>
              </form>
            </div>
          </TransitionChild>
        </div>
      </Dialog>
    </TransitionRoot>`,
};



