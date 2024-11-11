// Composables
import { createRouter, createWebHistory, Router, RouteRecordRaw } from "vue-router";

const lang = 'fi' // this needs to be dynamic
const prefix = `/${lang}/hakukone`

const routes: RouteRecordRaw[] = [
  {
    path: "/",
    component: () => import("@/layouts/default/Default.vue"),
    children: [
      {
        path: "",
        name: "Home",
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ "@/views/Home.vue")
      },
      {
        path: "degrees",
        name: "DegreeView",
        component: () => import("@/views/DegreeView.vue")
      },
      {
        path: "degrees/:degreeId",
        name: "degreeMatches",
        component: () => import("@/views/DegreeViewMatches.vue")
      },
      {
        path: "degrees/:degreeId/:skillId",
        name: "degreeResult",
        component: () => import("@/views/DegreeViewResult.vue")
      },
      {
        path: "skills",
        name: "SkillView",
        component: () => import("@/views/SkillView.vue")
      },
      {
        path: "skills/:skillId",
        name: "skillMatches",
        component: () => import("@/views/SkillViewMatches.vue")
      },
      {
        path: "skills/:skillId/:degreeId",
        name: "skillResults",
        component: () => import("@/views/SkillViewResult.vue")
      },
    ]
  }
];

const router: Router = createRouter({
  history: createWebHistory(`${prefix}`),
  routes
});

export default router;
