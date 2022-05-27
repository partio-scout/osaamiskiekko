<template>
  <school-student>
    <school-student-part1
      :heading="content['part1-h1']"
      :text="content['part1-p1']"
      :button-name="content['part5-t3']"
      img-url="/images/osamiskiekko-flower.jpg"
      :is-student="false"
      :image-alt="content['alt-osamiskiekko-flower']"
    />

    <school-student-part2-and-3
      :heading="content['part2-h2']"
      :text="content['part2-p1']"
      :sub-heading="content['part2-h1']"
      img-url="/images/osamiskiekko-tiger.jpg"
      :is-student="false"
      :image-alt="content['alt-osamiskiekko-tiger']"
      image-side="left"
    />

    <school-student-part2-and-3
      :heading="content['part3-h2']"
      :text="content['part3-p1']"
      :sub-heading="content['part3-h1']"
      img-url="/images/osamiskiekko-butterfly.jpg"
      :is-student="false"
      :image-alt="content['alt-osamiskiekko-butterfly']"
      image-side="right"
    />

    <school-student-part4
      :heading="content['part4-h1']"
      :text="content['part4-p1']"
    />

    <school-student-part5
      :is-student="false"
      :image-alt="content['alt-osamiskiekko-zebra']"
      img-url="/images/osamiskiekko-zebra.jpg"
    />
  </school-student>
</template>

<script>
export default {
  async asyncData ({ $content, $config: { siteId } }) {
    const content = await $content(
      'schools-and-organizations/schools-and-organizations-' + siteId
    ).fetch()
    return {
      content
    }
  },

  head () {
    return {
      title:
        this.$root.context.app.head.title + ' | ' + this.content['part1-h1'],
      meta: [
        // hid is used as unique identifier. Do not use `vmid` for it as it will not work
        {
          hid: 'description',
          name: 'description',
          content: this.content['part1-p1']
        }
      ]
    }
  }
}
</script>
