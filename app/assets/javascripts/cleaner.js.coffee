$ ->
  out = document.querySelector('#output')
  url = window.URL or window.webkitURL
  objURL = url.createObjectURL or false
  fileinput = document.querySelector('#getfile')
  c = document.querySelector('canvas')
  cx = c.getContext('2d')
  str = ''
  i = 0
  app = document.querySelector('#app')

  getfile = (e) ->
    document.body.classList.remove 'dragdrop'
    i = 0
    file = if e.dataTransfer then e.dataTransfer.files[0] else e.target.files[0]
    EXIF.getData file, ->
      `var i`
      if i != 0
        if objURL
          loadImage url.createObjectURL(file), file.name
        else
          reader = new FileReader
          reader.readAsDataURL file

          reader.onload = (ev) ->
            loadImage ev.target.result, file.name
            return

      else
        output.innerHTML = 'Image is already clean!'
      return
    e.preventDefault()
    return

  loadImage = (file, name) ->
    img = new Image
    img.src = file

    img.onload = ->
      imagetocanvas this, img.naturalWidth, img.naturalHeight, name
      return

    return

  imagetocanvas = (img, w, h, name) ->
    c.width = w
    c.height = h
    cx.drawImage img, 0, 0, w, h
    dlname = name.replace(/\.([^\.]+)$/, '-cleaned.jpg')
    out.innerHTML += '<a href="' + c.toDataURL('image/jpeg', 0.9) + '" ' + 'download="' + dlname + '">Download clean image</a>'
    return

  fileinput.addEventListener 'change', getfile, false
