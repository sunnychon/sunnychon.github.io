# sunnychon.github.io
<!DOCTYPE html>
<!-- saved from url=(0052)file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/ -->
<html dir="ltr" lang="zh"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="color-scheme" content="light dark">
<meta name="google" value="notranslate">

<script>
function addRow(name, url, isdir,
    size, size_string, date_modified, date_modified_string) {
  if (name == "." || name == "..")
    return;

  var root = document.location.pathname;
  if (root.substr(-1) !== "/")
    root += "/";

  var tbody = document.getElementById("tbody");
  var row = document.createElement("tr");
  var file_cell = document.createElement("td");
  var link = document.createElement("a");

  link.className = isdir ? "icon dir" : "icon file";

  if (isdir) {
    name = name + "/";
    url = url + "/";
    size = 0;
    size_string = "";
  } else {
    link.draggable = "true";
    link.addEventListener("dragstart", onDragStart, false);
  }
  link.innerText = name;
  link.href = root + url;

  file_cell.dataset.value = name;
  file_cell.appendChild(link);

  row.appendChild(file_cell);
  row.appendChild(createCell(size, size_string));
  row.appendChild(createCell(date_modified, date_modified_string));

  tbody.appendChild(row);
}

function onDragStart(e) {
  var el = e.srcElement;
  var name = el.innerText.replace(":", "");
  var download_url_data = "application/octet-stream:" + name + ":" + el.href;
  e.dataTransfer.setData("DownloadURL", download_url_data);
  e.dataTransfer.effectAllowed = "copy";
}

function createCell(value, text) {
  var cell = document.createElement("td");
  cell.setAttribute("class", "detailsColumn");
  cell.dataset.value = value;
  cell.innerText = text;
  return cell;
}

function start(location) {
  var header = document.getElementById("header");
  header.innerText = header.innerText.replace("LOCATION", location);

  document.getElementById("title").innerText = header.innerText;
}

function onHasParentDirectory() {
  var box = document.getElementById("parentDirLinkBox");
  box.style.display = "block";

  var root = document.location.pathname;
  if (!root.endsWith("/"))
    root += "/";

  var link = document.getElementById("parentDirLink");
  link.href = root + "..";
}

function sortTable(column) {
  var theader = document.getElementById("theader");
  var oldOrder = theader.cells[column].dataset.order || '1';
  oldOrder = parseInt(oldOrder, 10)
  var newOrder = 0 - oldOrder;
  theader.cells[column].dataset.order = newOrder;

  var tbody = document.getElementById("tbody");
  var rows = tbody.rows;
  var list = [], i;
  for (i = 0; i < rows.length; i++) {
    list.push(rows[i]);
  }

  list.sort(function(row1, row2) {
    var a = row1.cells[column].dataset.value;
    var b = row2.cells[column].dataset.value;
    if (column) {
      a = parseInt(a, 10);
      b = parseInt(b, 10);
      return a > b ? newOrder : a < b ? oldOrder : 0;
    }

    // Column 0 is text.
    if (a > b)
      return newOrder;
    if (a < b)
      return oldOrder;
    return 0;
  });

  // Appending an existing child again just moves it.
  for (i = 0; i < list.length; i++) {
    tbody.appendChild(list[i]);
  }
}

// Add event handlers to column headers.
function addHandlers(element, column) {
  element.onclick = (e) => sortTable(column);
  element.onkeydown = (e) => {
    if (e.key == 'Enter' || e.key == ' ') {
      sortTable(column);
      e.preventDefault();
    }
  };
}

function onLoad() {
  addHandlers(document.getElementById('nameColumnHeader'), 0);
  addHandlers(document.getElementById('sizeColumnHeader'), 1);
  addHandlers(document.getElementById('dateColumnHeader'), 2);
}

window.addEventListener('DOMContentLoaded', onLoad);
</script>

<style>

  h1 {
    border-bottom: 1px solid #c0c0c0;
    margin-bottom: 10px;
    padding-bottom: 10px;
    white-space: nowrap;
  }

  table {
    border-collapse: collapse;
  }

  th {
    cursor: pointer;
  }

  td.detailsColumn {
    padding-inline-start: 2em;
    text-align: end;
    white-space: nowrap;
  }

  a.icon {
    padding-inline-start: 1.5em;
    text-decoration: none;
    user-select: auto;
  }

  a.icon:hover {
    text-decoration: underline;
  }

  a.file {
    background : url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAABnRSTlMAAAAAAABupgeRAAABEElEQVR42nRRx3HDMBC846AHZ7sP54BmWAyrsP588qnwlhqw/k4v5ZwWxM1hzmGRgV1cYqrRarXoH2w2m6qqiqKIR6cPtzc3xMSML2Te7XZZlnW7Pe/91/dX47WRBHuA9oyGmRknzGDjab1ePzw8bLfb6WRalmW4ip9FDVpYSWZgOp12Oh3nXJ7nxoJSGEciteP9y+fH52q1euv38WosqA6T2gGOT44vry7BEQtJkMAMMpa6JagAMcUfWYa4hkkzAc7fFlSjwqCoOUYAF5RjHZPVCFBOtSBGfgUDji3c3jpibeEMQhIMh8NwshqyRsBJgvF4jMs/YlVR5KhgNpuBLzk0OcUiR3CMhcPaOzsZiAAA/AjmaB3WZIkAAAAASUVORK5CYII=") left top no-repeat;
  }

  a.dir {
    background : url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABt0lEQVR42oxStZoWQRCs2cXdHTLcHZ6EjAwnQWIkJyQlRt4Cd3d3d1n5d7q7ju1zv/q+mh6taQsk8fn29kPDRo87SDMQcNAUJgIQkBjdAoRKdXjm2mOH0AqS+PlkP8sfp0h93iu/PDji9s2FzSSJVg5ykZqWgfGRr9rAAAQiDFoB1OfyESZEB7iAI0lHwLREQBcQQKqo8p+gNUCguwCNAAUQAcFOb0NNGjT+BbUC2YsHZpWLhC6/m0chqIoM1LKbQIIBwlTQE1xAo9QDGDPYf6rkTpPc92gCUYVJAZjhyZltJ95f3zuvLYRGWWCUNkDL2333McBh4kaLlxg+aTmyL7c2xTjkN4Bt7oE3DBP/3SRz65R/bkmBRPGzcRNHYuzMjaj+fdnaFoJUEdTSXfaHbe7XNnMPyqryPcmfY+zURaAB7SHk9cXSH4fQ5rojgCAVIuqCNWgRhLYLhJB4k3iZfIPtnQiCpjAzeBIRXMA6emAqoEbQSoDdGxFUrxS1AYcpaNbBgyQBGJEOnYOeENKR/iAd1npusI4C75/c3539+nbUjOgZV5CkAU27df40lH+agUdIuA/EAgDmZnwZlhDc0wAAAABJRU5ErkJggg==") left top no-repeat;
  }

  a.up {
    background : url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACM0lEQVR42myTA+w1RxRHz+zftmrbdlTbtq04qRGrCmvbDWp9tq3a7tPcub8mj9XZ3eHOGQdJAHw77/LbZuvnWy+c/CIAd+91CMf3bo+bgcBiBAGIZKXb19/zodsAkFT+3px+ssYfyHTQW5tr05dCOf3xN49KaVX9+2zy1dX4XMk+5JflN5MBPL30oVsvnvEyp+18Nt3ZAErQMSFOfelCFvw0HcUloDayljZkX+MmamTAMTe+d+ltZ+1wEaRAX/MAnkJdcujzZyErIiVSzCEvIiq4O83AG7LAkwsfIgAnbncag82jfPPdd9RQyhPkpNJvKJWQBKlYFmQA315n4YPNjwMAZYy0TgAweedLmLzTJSTLIxkWDaVCVfAbbiKjytgmm+EGpMBYW0WwwbZ7lL8anox/UxekaOW544HO0ANAshxuORT/RG5YSrjlwZ3lM955tlQqbtVMlWIhjwzkAVFB8Q9EAAA3AFJ+DR3DO/Pnd3NPi7H117rAzWjpEs8vfIqsGZpaweOfEAAFJKuM0v6kf2iC5pZ9+fmLSZfWBVaKfLLNOXj6lYY0V2lfyVCIsVzmcRV9Y0fx02eTaEwhl2PDrXcjFdYRAohQmS8QEFLCLKGYA0AeEakhCCFDXqxsE0AQACgAQp5w96o0lAXuNASeDKWIvADiHwigfBINpWKtAXJvCEKWgSJNbRvxf4SmrnKDpvZavePu1K/zu/due1X/6Nj90MBd/J2Cic7WjBp/jUdIuA8AUtd65M+PzXIAAAAASUVORK5CYII=") left top no-repeat;
  }

  html[dir=rtl] a {
    background-position-x: right;
  }

  #parentDirLinkBox {
    margin-bottom: 10px;
    padding-bottom: 10px;
  }
</style>

<title id="title">C:\Users\ChonAI\OneDrive\桌面\ 的索引</title>

</head>

<body>

<h1 id="header">C:\Users\ChonAI\OneDrive\桌面\ 的索引</h1>

<div id="parentDirLinkBox" style="display: block;">
  <a id="parentDirLink" class="icon up" href="file:///C:/Users/ChonAI/OneDrive/">
    <span id="parentDirText">[父目錄]</span>
  </a>
</div>

<table>
  <thead>
    <tr class="header" id="theader">
      <th id="nameColumnHeader" tabindex="0" role="button">名稱</th>
      <th id="sizeColumnHeader" class="detailsColumn" tabindex="0" role="button">
        大小
      </th>
      <th id="dateColumnHeader" class="detailsColumn" tabindex="0" role="button">
        已修改日期
      </th>
    </tr>
  </thead>
  <tbody id="tbody">
  <tr><td data-value="3D Minecraft in Minecraft/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/3D%20Minecraft%20in%20Minecraft/">3D Minecraft in Minecraft/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1664551336">2022/9/30 晚上11:22:16</td></tr><tr><td data-value="422/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/422/">422/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1663441119">2022/9/18 凌晨2:58:39</td></tr><tr><td data-value="7z/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/7z/">7z/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666473087">2022/10/23 清晨5:11:27</td></tr><tr><td data-value="adb/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/adb/">adb/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1663165949">2022/9/14 晚上10:32:29</td></tr><tr><td data-value="all/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/all/">all/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1664291176">2022/9/27 晚上11:06:16</td></tr><tr><td data-value="batchinstallerv1/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/batchinstallerv1/">batchinstallerv1/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666482604">2022/10/23 清晨7:50:04</td></tr><tr><td data-value="BOOKS/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/BOOKS/">BOOKS/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1664789004">2022/10/3 下午5:23:24</td></tr><tr><td data-value="DiskGenius/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/DiskGenius/">DiskGenius/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1664844348">2022/10/4 上午8:45:48</td></tr><tr><td data-value="doc/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/doc/">doc/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1665880576">2022/10/16 上午8:36:16</td></tr><tr><td data-value="dosbox/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/dosbox/">dosbox/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666288708">2022/10/21 凌晨1:58:28</td></tr><tr><td data-value="DOSBox-Win31/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/DOSBox-Win31/">DOSBox-Win31/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666434321">2022/10/22 下午6:25:21</td></tr><tr><td data-value="downloader/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/downloader/">downloader/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666063320">2022/10/18 上午11:22:00</td></tr><tr><td data-value="enchcracker-1.6/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/enchcracker-1.6/">enchcracker-1.6/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1662251626">2022/9/4 上午8:33:46</td></tr><tr><td data-value="fontsifound/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/fontsifound/">fontsifound/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666434247">2022/10/22 下午6:24:07</td></tr><tr><td data-value="githoup/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/githoup/">githoup/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1664896119">2022/10/4 晚上11:08:39</td></tr><tr><td data-value="img/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/img/">img/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1664894076">2022/10/4 晚上10:34:36</td></tr><tr><td data-value="java/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/java/">java/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666067188">2022/10/18 中午12:26:28</td></tr><tr><td data-value="javabuild/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/javabuild/">javabuild/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1665933493">2022/10/16 晚上11:18:13</td></tr><tr><td data-value="mc1.5 textures/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/mc1.5%20textures/">mc1.5 textures/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666088572">2022/10/18 下午6:22:52</td></tr><tr><td data-value="mcmod/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/mcmod/">mcmod/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1664887214">2022/10/4 晚上8:40:14</td></tr><tr><td data-value="minecraft1.5.2/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/minecraft1.5.2/">minecraft1.5.2/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666067187">2022/10/18 中午12:26:27</td></tr><tr><td data-value="MP3/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/MP3/">MP3/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1664789003">2022/10/3 下午5:23:23</td></tr><tr><td data-value="MultiMC/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/MultiMC/">MultiMC/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1664857896">2022/10/4 中午12:31:36</td></tr><tr><td data-value="nbtedit/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/nbtedit/">nbtedit/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1661310447">2022/8/24 上午11:07:27</td></tr><tr><td data-value="pal_dos/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/pal_dos/">pal_dos/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666288803">2022/10/21 凌晨2:00:03</td></tr><tr><td data-value="ps2/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/ps2/">ps2/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1661323771">2022/8/24 下午2:49:31</td></tr><tr><td data-value="pyinstaler/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/pyinstaler/">pyinstaler/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666082251">2022/10/18 下午4:37:31</td></tr><tr><td data-value="pyloris-3.2/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/pyloris-3.2/">pyloris-3.2/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666075533">2022/10/18 下午2:45:33</td></tr><tr><td data-value="Python26/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Python26/">Python26/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666075497">2022/10/18 下午2:44:57</td></tr><tr><td data-value="REMINDER/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/REMINDER/">REMINDER/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1664789004">2022/10/3 下午5:23:24</td></tr><tr><td data-value="Scan/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Scan/">Scan/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1665318383">2022/10/9 晚上8:26:23</td></tr><tr><td data-value="sdpal/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/sdpal/">sdpal/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666420743">2022/10/22 下午2:39:03</td></tr><tr><td data-value="text/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/text/">text/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666511372">2022/10/23 下午3:49:32</td></tr><tr><td data-value="videoplay/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/videoplay/">videoplay/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666474025">2022/10/23 清晨5:27:05</td></tr><tr><td data-value="web/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/web/">web/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666088211">2022/10/18 下午6:16:51</td></tr><tr><td data-value="WIN31/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/WIN31/">WIN31/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1666616474">2022/10/24 晚上9:01:14</td></tr><tr><td data-value="WOR/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/WOR/">WOR/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1660544944">2022/8/15 下午2:29:04</td></tr><tr><td data-value="zip/"><a class="icon dir" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/zip/">zip/</a></td><td class="detailsColumn" data-value="0"></td><td class="detailsColumn" data-value="1664111709">2022/9/25 晚上9:15:09</td></tr><tr><td data-value="0.fat"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/0.fat">0.fat</a></td><td class="detailsColumn" data-value="268435456">256 MB</td><td class="detailsColumn" data-value="1664544404">2022/9/30 晚上9:26:44</td></tr><tr><td data-value="1.img"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/1.img">1.img</a></td><td class="detailsColumn" data-value="1736441856">1.6 GB</td><td class="detailsColumn" data-value="1664543976">2022/9/30 晚上9:19:36</td></tr><tr><td data-value="1.wav"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/1.wav">1.wav</a></td><td class="detailsColumn" data-value="693164">677 kB</td><td class="detailsColumn" data-value="960483600">2000/6/9 凌晨1:00:00</td></tr><tr><td data-value="2.wav"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/2.wav">2.wav</a></td><td class="detailsColumn" data-value="6718">6.6 kB</td><td class="detailsColumn" data-value="960483600">2000/6/9 凌晨1:00:00</td></tr><tr><td data-value="7zip.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/7zip.lnk">7zip.lnk</a></td><td class="detailsColumn" data-value="1361">1.3 kB</td><td class="detailsColumn" data-value="1647352380">2022/3/15 晚上9:53:00</td></tr><tr><td data-value="8514SYS.FON"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/8514SYS.FON">8514SYS.FON</a></td><td class="detailsColumn" data-value="9280">9.1 kB</td><td class="detailsColumn" data-value="1666282622">2022/10/21 凌晨12:17:02</td></tr><tr><td data-value="888gf.jpg"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/888gf.jpg">888gf.jpg</a></td><td class="detailsColumn" data-value="696842">681 kB</td><td class="detailsColumn" data-value="1663856005">2022/9/22 晚上10:13:25</td></tr><tr><td data-value="多開管理器.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/%E5%A4%9A%E9%96%8B%E7%AE%A1%E7%90%86%E5%99%A8.lnk">多開管理器.lnk</a></td><td class="detailsColumn" data-value="973">973 B</td><td class="detailsColumn" data-value="1662806920">2022/9/10 下午6:48:40</td></tr><tr><td data-value="系統.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/%E7%B3%BB%E7%B5%B1.lnk">系統.lnk</a></td><td class="detailsColumn" data-value="453">453 B</td><td class="detailsColumn" data-value="1662797284">2022/9/10 下午4:08:04</td></tr><tr><td data-value="逍遙模擬器.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/%E9%80%8D%E9%81%99%E6%A8%A1%E6%93%AC%E5%99%A8.lnk">逍遙模擬器.lnk</a></td><td class="detailsColumn" data-value="934">934 B</td><td class="detailsColumn" data-value="1662806920">2022/9/10 下午6:48:40</td></tr><tr><td data-value="新文字文件 (2).txt"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/%E6%96%B0%E6%96%87%E5%AD%97%E6%96%87%E4%BB%B6%20(2).txt">新文字文件 (2).txt</a></td><td class="detailsColumn" data-value="57">57 B</td><td class="detailsColumn" data-value="1666077931">2022/10/18 下午3:25:31</td></tr><tr><td data-value="新文字文件.txt"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/%E6%96%B0%E6%96%87%E5%AD%97%E6%96%87%E4%BB%B6.txt">新文字文件.txt</a></td><td class="detailsColumn" data-value="5">5 B</td><td class="detailsColumn" data-value="1664214301">2022/9/27 凌晨1:45:01</td></tr><tr><td data-value="螢幕擷取畫面 2022-10-23 103404.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/%E8%9E%A2%E5%B9%95%E6%93%B7%E5%8F%96%E7%95%AB%E9%9D%A2%202022-10-23%20103404.png">螢幕擷取畫面 2022-10-23 103404.png</a></td><td class="detailsColumn" data-value="482549">471 kB</td><td class="detailsColumn" data-value="1666492451">2022/10/23 上午10:34:11</td></tr><tr><td data-value="assets.zip"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/assets.zip">assets.zip</a></td><td class="detailsColumn" data-value="6509604">6.2 MB</td><td class="detailsColumn" data-value="1665996012">2022/10/17 下午4:40:12</td></tr><tr><td data-value="Bad Apple .exe"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Bad%20Apple%20.exe">Bad Apple .exe</a></td><td class="detailsColumn" data-value="14807040">14.1 MB</td><td class="detailsColumn" data-value="1666101474">2022/10/18 晚上9:57:54</td></tr><tr><td data-value="Bad Apple Console.exe"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Bad%20Apple%20Console.exe">Bad Apple Console.exe</a></td><td class="detailsColumn" data-value="22539264">21.5 MB</td><td class="detailsColumn" data-value="1666101674">2022/10/18 晚上10:01:14</td></tr><tr><td data-value="Bad Apple.mp3"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Bad%20Apple.mp3">Bad Apple.mp3</a></td><td class="detailsColumn" data-value="3503366">3.3 MB</td><td class="detailsColumn" data-value="1666101674">2022/10/18 晚上10:01:14</td></tr><tr><td data-value="badapple.mp4"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/badapple.mp4">badapple.mp4</a></td><td class="detailsColumn" data-value="22711433">21.7 MB</td><td class="detailsColumn" data-value="1666473339">2022/10/23 清晨5:15:39</td></tr><tr><td data-value="Bat_To_Exe_Converter_(Installer).exe"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Bat_To_Exe_Converter_(Installer).exe">Bat_To_Exe_Converter_(Installer).exe</a></td><td class="detailsColumn" data-value="4482593">4.3 MB</td><td class="detailsColumn" data-value="1594198791">2020/7/8 下午4:59:51</td></tr><tr><td data-value="bb.bin"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/bb.bin">bb.bin</a></td><td class="detailsColumn" data-value="51379928">49.0 MB</td><td class="detailsColumn" data-value="1666280748">2022/10/20 晚上11:45:48</td></tr><tr><td data-value="BG.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/BG.png">BG.png</a></td><td class="detailsColumn" data-value="8701">8.5 kB</td><td class="detailsColumn" data-value="1666290317">2022/10/21 凌晨2:25:17</td></tr><tr><td data-value="Black Thatch.bmp"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Black%20Thatch.bmp">Black Thatch.bmp</a></td><td class="detailsColumn" data-value="182">182 B</td><td class="detailsColumn" data-value="960454800">2000/6/8 下午5:00:00</td></tr><tr><td data-value="Blockbench.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Blockbench.lnk">Blockbench.lnk</a></td><td class="detailsColumn" data-value="2369">2.3 kB</td><td class="detailsColumn" data-value="1664108339">2022/9/25 晚上8:18:59</td></tr><tr><td data-value="Bubbles.bmp"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Bubbles.bmp">Bubbles.bmp</a></td><td class="detailsColumn" data-value="2118">2.1 kB</td><td class="detailsColumn" data-value="960454800">2000/6/8 下午5:00:00</td></tr><tr><td data-value="chicken.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/chicken.png">chicken.png</a></td><td class="detailsColumn" data-value="472">472 B</td><td class="detailsColumn" data-value="1654566110">2022/6/7 上午9:41:50</td></tr><tr><td data-value="chickenbeautiful-1.12.2-2.0(已修蹦端BUG).zip"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/chickenbeautiful-1.12.2-2.0(%E5%B7%B2%E4%BF%AE%E8%B9%A6%E7%AB%AFBUG).zip">chickenbeautiful-1.12.2-2.0(已修蹦端BUG).zip</a></td><td class="detailsColumn" data-value="232381">227 kB</td><td class="detailsColumn" data-value="1664109222">2022/9/25 晚上8:33:42</td></tr><tr><td data-value="CLOUD.GIF"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/CLOUD.GIF">CLOUD.GIF</a></td><td class="detailsColumn" data-value="11306">11.0 kB</td><td class="detailsColumn" data-value="960454800">2000/6/8 下午5:00:00</td></tr><tr><td data-value="Compliance Resource Pack.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Compliance%20Resource%20Pack.lnk">Compliance Resource Pack.lnk</a></td><td class="detailsColumn" data-value="2804">2.7 kB</td><td class="detailsColumn" data-value="1644053574">2022/2/5 下午5:32:54</td></tr><tr><td data-value="computerinfo.html"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/computerinfo.html">computerinfo.html</a></td><td class="detailsColumn" data-value="162564">159 kB</td><td class="detailsColumn" data-value="1664893905">2022/10/4 晚上10:31:45</td></tr><tr><td data-value="decompile.html"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/decompile.html">decompile.html</a></td><td class="detailsColumn" data-value="3474">3.4 kB</td><td class="detailsColumn" data-value="1666088257">2022/10/18 下午6:17:37</td></tr><tr><td data-value="desktop.ini"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/desktop.ini">desktop.ini</a></td><td class="detailsColumn" data-value="658">658 B</td><td class="detailsColumn" data-value="1660375804">2022/8/13 下午3:30:04</td></tr><tr><td data-value="Discord.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Discord.lnk">Discord.lnk</a></td><td class="detailsColumn" data-value="2245">2.2 kB</td><td class="detailsColumn" data-value="1666496807">2022/10/23 上午11:46:47</td></tr><tr><td data-value="dosbox.conf"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/dosbox.conf">dosbox.conf</a></td><td class="detailsColumn" data-value="136">136 B</td><td class="detailsColumn" data-value="1666288803">2022/10/21 凌晨2:00:03</td></tr><tr><td data-value="DR.PC F@MILY電腦『學與教』.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/DR.PC%20F@MILY%E9%9B%BB%E8%85%A6%E3%80%8E%E5%AD%B8%E8%88%87%E6%95%99%E3%80%8F.lnk">DR.PC F@MILY電腦『學與教』.lnk</a></td><td class="detailsColumn" data-value="2818">2.8 kB</td><td class="detailsColumn" data-value="1650700438">2022/4/23 下午3:53:58</td></tr><tr><td data-value="draw_badapple_in_terminal(video+audio).py"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/draw_badapple_in_terminal(video+audio).py">draw_badapple_in_terminal(video+audio).py</a></td><td class="detailsColumn" data-value="2581">2.5 kB</td><td class="detailsColumn" data-value="1666105326">2022/10/18 晚上11:02:06</td></tr><tr><td data-value="ERROR422.exe"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/ERROR422.exe">ERROR422.exe</a></td><td class="detailsColumn" data-value="8417280">8.0 MB</td><td class="detailsColumn" data-value="1580274481">2020/1/29 下午1:08:01</td></tr><tr><td data-value="EV录屏.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/EV%E5%BD%95%E5%B1%8F.lnk">EV录屏.lnk</a></td><td class="detailsColumn" data-value="1179">1.2 kB</td><td class="detailsColumn" data-value="1630028219">2021/8/27 上午9:36:59</td></tr><tr><td data-value="EV剪辑.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/EV%E5%89%AA%E8%BE%91.lnk">EV剪辑.lnk</a></td><td class="detailsColumn" data-value="1165">1.1 kB</td><td class="detailsColumn" data-value="1628579267">2021/8/10 下午3:07:47</td></tr><tr><td data-value="fake shutdown.html"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/fake%20shutdown.html">fake shutdown.html</a></td><td class="detailsColumn" data-value="38">38 B</td><td class="detailsColumn" data-value="1666077024">2022/10/18 下午3:10:24</td></tr><tr><td data-value="fax3855khz.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/fax3855khz.png">fax3855khz.png</a></td><td class="detailsColumn" data-value="924178">903 kB</td><td class="detailsColumn" data-value="1664288442">2022/9/27 晚上10:20:42</td></tr><tr><td data-value="GitHub Desktop.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/GitHub%20Desktop.lnk">GitHub Desktop.lnk</a></td><td class="detailsColumn" data-value="2385">2.3 kB</td><td class="detailsColumn" data-value="1664862440">2022/10/4 下午1:47:20</td></tr><tr><td data-value="hh.zip"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/hh.zip">hh.zip</a></td><td class="detailsColumn" data-value="20769132">19.8 MB</td><td class="detailsColumn" data-value="1666280807">2022/10/20 晚上11:46:47</td></tr><tr><td data-value="homework.txt"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/homework.txt">homework.txt</a></td><td class="detailsColumn" data-value="0">0 B</td><td class="detailsColumn" data-value="1666279468">2022/10/20 晚上11:24:28</td></tr><tr><td data-value="HorionInjector (3).exe"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/HorionInjector%20(3).exe">HorionInjector (3).exe</a></td><td class="detailsColumn" data-value="151040">148 kB</td><td class="detailsColumn" data-value="1634123865">2021/10/13 晚上7:17:45</td></tr><tr><td data-value="icon.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/icon.png">icon.png</a></td><td class="detailsColumn" data-value="30054">29.3 kB</td><td class="detailsColumn" data-value="1665933481">2022/10/16 晚上11:18:01</td></tr><tr><td data-value="index.html"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/index.html">index.html</a></td><td class="detailsColumn" data-value="201326">197 kB</td><td class="detailsColumn" data-value="1660895139">2022/8/19 下午3:45:39</td></tr><tr><td data-value="Internet Explorer.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Internet%20Explorer.lnk">Internet Explorer.lnk</a></td><td class="detailsColumn" data-value="1343">1.3 kB</td><td class="detailsColumn" data-value="1659281611">2022/7/31 晚上11:33:31</td></tr><tr><td data-value="ipscanner.jar"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/ipscanner.jar">ipscanner.jar</a></td><td class="detailsColumn" data-value="2363638">2.3 MB</td><td class="detailsColumn" data-value="1663422623">2022/9/17 晚上9:50:23</td></tr><tr><td data-value="javabuildertools.zip"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/javabuildertools.zip">javabuildertools.zip</a></td><td class="detailsColumn" data-value="3099">3.0 kB</td><td class="detailsColumn" data-value="1664856927">2022/10/4 中午12:15:27</td></tr><tr><td data-value="javaws.exe"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/javaws.exe">javaws.exe</a></td><td class="detailsColumn" data-value="457424">447 kB</td><td class="detailsColumn" data-value="1659585823">2022/8/4 中午12:03:43</td></tr><tr><td data-value="lnm.txt"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/lnm.txt">lnm.txt</a></td><td class="detailsColumn" data-value="8">8 B</td><td class="detailsColumn" data-value="1665312524">2022/10/9 下午6:48:44</td></tr><tr><td data-value="MCreator.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/MCreator.lnk">MCreator.lnk</a></td><td class="detailsColumn" data-value="969">969 B</td><td class="detailsColumn" data-value="1664198662">2022/9/26 晚上9:24:22</td></tr><tr><td data-value="Microsoft Edge.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Microsoft%20Edge.lnk">Microsoft Edge.lnk</a></td><td class="detailsColumn" data-value="2341">2.3 kB</td><td class="detailsColumn" data-value="1654115981">2022/6/2 凌晨4:39:41</td></tr><tr><td data-value="Minecraft Launcher.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Minecraft%20Launcher.lnk">Minecraft Launcher.lnk</a></td><td class="detailsColumn" data-value="1319">1.3 kB</td><td class="detailsColumn" data-value="1659058733">2022/7/29 上午9:38:53</td></tr><tr><td data-value="Minecraft.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Minecraft.lnk">Minecraft.lnk</a></td><td class="detailsColumn" data-value="1693">1.7 kB</td><td class="detailsColumn" data-value="1663164384">2022/9/14 晚上10:06:24</td></tr><tr><td data-value="MinecraftHDbackground.zip"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/MinecraftHDbackground.zip">MinecraftHDbackground.zip</a></td><td class="detailsColumn" data-value="11901910">11.4 MB</td><td class="detailsColumn" data-value="1664892826">2022/10/4 晚上10:13:46</td></tr><tr><td data-value="minerpage.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/minerpage.png">minerpage.png</a></td><td class="detailsColumn" data-value="22349">21.8 kB</td><td class="detailsColumn" data-value="1664865173">2022/10/4 下午2:32:53</td></tr><tr><td data-value="mod.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/mod.png">mod.png</a></td><td class="detailsColumn" data-value="325308">318 kB</td><td class="detailsColumn" data-value="1664643112">2022/10/2 凌晨12:51:52</td></tr><tr><td data-value="mpv-x86_64-20221016-git-cdcbd73.7z"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/mpv-x86_64-20221016-git-cdcbd73.7z">mpv-x86_64-20221016-git-cdcbd73.7z</a></td><td class="detailsColumn" data-value="25855197">24.7 MB</td><td class="detailsColumn" data-value="1666473086">2022/10/23 清晨5:11:26</td></tr><tr><td data-value="MultiMC.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/MultiMC.lnk">MultiMC.lnk</a></td><td class="detailsColumn" data-value="1071">1.0 kB</td><td class="detailsColumn" data-value="1658754530">2022/7/25 晚上9:08:50</td></tr><tr><td data-value="pack.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/pack.png">pack.png</a></td><td class="detailsColumn" data-value="27267">26.6 kB</td><td class="detailsColumn" data-value="1640432902">2021/12/25 晚上7:48:22</td></tr><tr><td data-value="panorama0.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/panorama0.png">panorama0.png</a></td><td class="detailsColumn" data-value="71767">70.1 kB</td><td class="detailsColumn" data-value="1664110854">2022/9/25 晚上9:00:54</td></tr><tr><td data-value="panorama1.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/panorama1.png">panorama1.png</a></td><td class="detailsColumn" data-value="89196">87.1 kB</td><td class="detailsColumn" data-value="1664110972">2022/9/25 晚上9:02:52</td></tr><tr><td data-value="panorama2.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/panorama2.png">panorama2.png</a></td><td class="detailsColumn" data-value="87261">85.2 kB</td><td class="detailsColumn" data-value="1664111006">2022/9/25 晚上9:03:26</td></tr><tr><td data-value="panorama3.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/panorama3.png">panorama3.png</a></td><td class="detailsColumn" data-value="5057298">4.8 MB</td><td class="detailsColumn" data-value="1664111258">2022/9/25 晚上9:07:38</td></tr><tr><td data-value="panorama4.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/panorama4.png">panorama4.png</a></td><td class="detailsColumn" data-value="18683">18.2 kB</td><td class="detailsColumn" data-value="1664111414">2022/9/25 晚上9:10:14</td></tr><tr><td data-value="panorama5.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/panorama5.png">panorama5.png</a></td><td class="detailsColumn" data-value="111182">109 kB</td><td class="detailsColumn" data-value="1664111468">2022/9/25 晚上9:11:08</td></tr><tr><td data-value="paytheprice.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/paytheprice.png">paytheprice.png</a></td><td class="detailsColumn" data-value="87034">85.0 kB</td><td class="detailsColumn" data-value="1640436576">2021/12/25 晚上8:49:36</td></tr><tr><td data-value="Resource Hacker.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Resource%20Hacker.lnk">Resource Hacker.lnk</a></td><td class="detailsColumn" data-value="1180">1.2 kB</td><td class="detailsColumn" data-value="1654099864">2022/6/2 凌晨12:11:04</td></tr><tr><td data-value="s.bat"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/s.bat">s.bat</a></td><td class="detailsColumn" data-value="960">960 B</td><td class="detailsColumn" data-value="1666279704">2022/10/20 晚上11:28:24</td></tr><tr><td data-value="Scratch 3.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Scratch%203.lnk">Scratch 3.lnk</a></td><td class="detailsColumn" data-value="2417">2.4 kB</td><td class="detailsColumn" data-value="1657169155">2022/7/7 中午12:45:55</td></tr><tr><td data-value="screen rebuild.bat"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/screen%20rebuild.bat">screen rebuild.bat</a></td><td class="detailsColumn" data-value="21562">21.1 kB</td><td class="detailsColumn" data-value="1664293228">2022/9/27 晚上11:40:28</td></tr><tr><td data-value="Setup.bmp"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Setup.bmp">Setup.bmp</a></td><td class="detailsColumn" data-value="308280">301 kB</td><td class="detailsColumn" data-value="960454800">2000/6/8 下午5:00:00</td></tr><tr><td data-value="ssText3d.scr"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/ssText3d.scr">ssText3d.scr</a></td><td class="detailsColumn" data-value="198656">194 kB</td><td class="detailsColumn" data-value="1575709786">2019/12/7 下午5:09:46</td></tr><tr><td data-value="start.bat"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/start.bat">start.bat</a></td><td class="detailsColumn" data-value="784">784 B</td><td class="detailsColumn" data-value="1660634484">2022/8/16 下午3:21:24</td></tr><tr><td data-value="timeoutoutput.log"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/timeoutoutput.log">timeoutoutput.log</a></td><td class="detailsColumn" data-value="5936">5.8 kB</td><td class="detailsColumn" data-value="1664546447">2022/9/30 晚上10:00:47</td></tr><tr><td data-value="TurboWarp.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/TurboWarp.lnk">TurboWarp.lnk</a></td><td class="detailsColumn" data-value="2429">2.4 kB</td><td class="detailsColumn" data-value="1658841363">2022/7/26 晚上9:16:03</td></tr><tr><td data-value="Unity Hub.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Unity%20Hub.lnk">Unity Hub.lnk</a></td><td class="detailsColumn" data-value="1889">1.8 kB</td><td class="detailsColumn" data-value="1650717827">2022/4/23 晚上8:43:47</td></tr><tr><td data-value="updater.bat"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/updater.bat">updater.bat</a></td><td class="detailsColumn" data-value="499">499 B</td><td class="detailsColumn" data-value="1665880576">2022/10/16 上午8:36:16</td></tr><tr><td data-value="VB6.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/VB6.lnk">VB6.lnk</a></td><td class="detailsColumn" data-value="1737">1.7 kB</td><td class="detailsColumn" data-value="1663326628">2022/9/16 晚上7:10:28</td></tr><tr><td data-value="Vbsedit.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Vbsedit.lnk">Vbsedit.lnk</a></td><td class="detailsColumn" data-value="1235">1.2 kB</td><td class="detailsColumn" data-value="1654113754">2022/6/2 凌晨4:02:34</td></tr><tr><td data-value="vgalogo.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/vgalogo.png">vgalogo.png</a></td><td class="detailsColumn" data-value="15413">15.1 kB</td><td class="detailsColumn" data-value="1666287828">2022/10/21 凌晨1:43:48</td></tr><tr><td data-value="Visual Studio Code.lnk"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/Visual%20Studio%20Code.lnk">Visual Studio Code.lnk</a></td><td class="detailsColumn" data-value="1416">1.4 kB</td><td class="detailsColumn" data-value="1650717576">2022/4/23 晚上8:39:36</td></tr><tr><td data-value="webdosbox.zip"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/webdosbox.zip">webdosbox.zip</a></td><td class="detailsColumn" data-value="30618933">29.2 MB</td><td class="detailsColumn" data-value="1666615973">2022/10/24 晚上8:52:53</td></tr><tr><td data-value="win404eff.sb3"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/win404eff.sb3">win404eff.sb3</a></td><td class="detailsColumn" data-value="219116">214 kB</td><td class="detailsColumn" data-value="1666488841">2022/10/23 上午9:34:01</td></tr><tr><td data-value="WINHLP32.EXE"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/WINHLP32.EXE">WINHLP32.EXE</a></td><td class="detailsColumn" data-value="336400">329 kB</td><td class="detailsColumn" data-value="1666282637">2022/10/21 凌晨12:17:17</td></tr><tr><td data-value="youtube link.bmp"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/youtube%20link.bmp">youtube link.bmp</a></td><td class="detailsColumn" data-value="921654">900 kB</td><td class="detailsColumn" data-value="1664644894">2022/10/2 凌晨1:21:34</td></tr><tr><td data-value="zbicon.png"><a class="icon file" draggable="true" href="file:///C:/Users/ChonAI/OneDrive/%E6%A1%8C%E9%9D%A2/zbicon.png">zbicon.png</a></td><td class="detailsColumn" data-value="12342">12.1 kB</td><td class="detailsColumn" data-value="1666279427">2022/10/20 晚上11:23:47</td></tr></tbody>
</table>




<script>// Copyright (c) 2012 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/**
 * @fileoverview This file defines a singleton which provides access to all data
 * that is available as soon as the page's resources are loaded (before DOM
 * content has finished loading). This data includes both localized strings and
 * any data that is important to have ready from a very early stage (e.g. things
 * that must be displayed right away).
 *
 * Note that loadTimeData is not guaranteed to be consistent between page
 * refreshes (https://crbug.com/740629) and should not contain values that might
 * change if the page is re-opened later.
 */

/** @type {!LoadTimeData} */
// eslint-disable-next-line no-var
var loadTimeData;

class LoadTimeData {
  constructor() {
    /** @type {?Object} */
    this.data_ = null;
  }

  /**
   * Sets the backing object.
   *
   * Note that there is no getter for |data_| to discourage abuse of the form:
   *
   *     var value = loadTimeData.data()['key'];
   *
   * @param {Object} value The de-serialized page data.
   */
  set data(value) {
    expect(!this.data_, 'Re-setting data.');
    this.data_ = value;
  }

  /**
   * @param {string} id An ID of a value that might exist.
   * @return {boolean} True if |id| is a key in the dictionary.
   */
  valueExists(id) {
    return id in this.data_;
  }

  /**
   * Fetches a value, expecting that it exists.
   * @param {string} id The key that identifies the desired value.
   * @return {*} The corresponding value.
   */
  getValue(id) {
    expect(this.data_, 'No data. Did you remember to include strings.js?');
    const value = this.data_[id];
    expect(typeof value !== 'undefined', 'Could not find value for ' + id);
    return value;
  }

  /**
   * As above, but also makes sure that the value is a string.
   * @param {string} id The key that identifies the desired string.
   * @return {string} The corresponding string value.
   */
  getString(id) {
    const value = this.getValue(id);
    expectIsType(id, value, 'string');
    return /** @type {string} */ (value);
  }

  /**
   * Returns a formatted localized string where $1 to $9 are replaced by the
   * second to the tenth argument.
   * @param {string} id The ID of the string we want.
   * @param {...(string|number)} var_args The extra values to include in the
   *     formatted output.
   * @return {string} The formatted string.
   */
  getStringF(id, var_args) {
    const value = this.getString(id);
    if (!value) {
      return '';
    }

    const args = Array.prototype.slice.call(arguments);
    args[0] = value;
    return this.substituteString.apply(this, args);
  }

  /**
   * Returns a formatted localized string where $1 to $9 are replaced by the
   * second to the tenth argument. Any standalone $ signs must be escaped as
   * $$.
   * @param {string} label The label to substitute through.
   *     This is not an resource ID.
   * @param {...(string|number)} var_args The extra values to include in the
   *     formatted output.
   * @return {string} The formatted string.
   */
  substituteString(label, var_args) {
    const varArgs = arguments;
    return label.replace(/\$(.|$|\n)/g, function(m) {
      expect(m.match(/\$[$1-9]/), 'Unescaped $ found in localized string.');
      return m === '$$' ? '$' : varArgs[m[1]];
    });
  }

  /**
   * Returns a formatted string where $1 to $9 are replaced by the second to
   * tenth argument, split apart into a list of pieces describing how the
   * substitution was performed. Any standalone $ signs must be escaped as $$.
   * @param {string} label A localized string to substitute through.
   *     This is not an resource ID.
   * @param {...(string|number)} var_args The extra values to include in the
   *     formatted output.
   * @return {!Array<!{value: string, arg: (null|string)}>} The formatted
   *     string pieces.
   */
  getSubstitutedStringPieces(label, var_args) {
    const varArgs = arguments;
    // Split the string by separately matching all occurrences of $1-9 and of
    // non $1-9 pieces.
    const pieces = (label.match(/(\$[1-9])|(([^$]|\$([^1-9]|$))+)/g) ||
                    []).map(function(p) {
      // Pieces that are not $1-9 should be returned after replacing $$
      // with $.
      if (!p.match(/^\$[1-9]$/)) {
        expect(
            (p.match(/\$/g) || []).length % 2 === 0,
            'Unescaped $ found in localized string.');
        return {value: p.replace(/\$\$/g, '$'), arg: null};
      }

      // Otherwise, return the substitution value.
      return {value: varArgs[p[1]], arg: p};
    });

    return pieces;
  }

  /**
   * As above, but also makes sure that the value is a boolean.
   * @param {string} id The key that identifies the desired boolean.
   * @return {boolean} The corresponding boolean value.
   */
  getBoolean(id) {
    const value = this.getValue(id);
    expectIsType(id, value, 'boolean');
    return /** @type {boolean} */ (value);
  }

  /**
   * As above, but also makes sure that the value is an integer.
   * @param {string} id The key that identifies the desired number.
   * @return {number} The corresponding number value.
   */
  getInteger(id) {
    const value = this.getValue(id);
    expectIsType(id, value, 'number');
    expect(value === Math.floor(value), 'Number isn\'t integer: ' + value);
    return /** @type {number} */ (value);
  }

  /**
   * Override values in loadTimeData with the values found in |replacements|.
   * @param {Object} replacements The dictionary object of keys to replace.
   */
  overrideValues(replacements) {
    expect(
        typeof replacements === 'object',
        'Replacements must be a dictionary object.');
    for (const key in replacements) {
      this.data_[key] = replacements[key];
    }
  }

  /**
   * Reset loadTimeData's data. Should only be used in tests.
   * @param {?Object} newData The data to restore to, when null restores to
   *    unset state.
   */
  resetForTesting(newData = null) {
    this.data_ = newData;
  }

  /**
   * @return {boolean} Whether loadTimeData.data has been set.
   */
  isInitialized() {
    return this.data_ !== null;
  }
}

  /**
   * Checks condition, throws error message if expectation fails.
   * @param {*} condition The condition to check for truthiness.
   * @param {string} message The message to display if the check fails.
   */
  function expect(condition, message) {
    if (!condition) {
      throw new Error(
          'Unexpected condition on ' + document.location.href + ': ' + message);
    }
  }

  /**
   * Checks that the given value has the given type.
   * @param {string} id The id of the value (only used for error message).
   * @param {*} value The value to check the type on.
   * @param {string} type The type we expect |value| to be.
   */
  function expectIsType(id, value, type) {
    expect(
        typeof value === type, '[' + value + '] (' + id + ') is not a ' + type);
  }

  expect(!loadTimeData, 'should only include this file once');
  loadTimeData = new LoadTimeData();

  // Expose |loadTimeData| directly on |window|, since within a JS module the
  // scope is local and not all files have been updated to import the exported
  // |loadTimeData| explicitly.
  window.loadTimeData = loadTimeData;

  console.warn('crbug/1173575, non-JS module files deprecated.');</script><script>loadTimeData.data = {"header":"LOCATION 的索引","headerDateModified":"已修改日期","headerName":"名稱","headerSize":"大小","language":"zh","parentDirText":"[父目錄]","textdirection":"ltr"};</script><script>start("C:\\Users\\ChonAI\\OneDrive\\桌面\\");</script>
<script>onHasParentDirectory();</script>
<script>addRow("3D Minecraft in Minecraft","3D%20Minecraft%20in%20Minecraft",1,0,"0 B",1664551336,"2022/9/30 晚上11:22:16");</script>
<script>addRow("422","422",1,0,"0 B",1663441119,"2022/9/18 凌晨2:58:39");</script>
<script>addRow("7z","7z",1,0,"0 B",1666473087,"2022/10/23 清晨5:11:27");</script>
<script>addRow("adb","adb",1,0,"0 B",1663165949,"2022/9/14 晚上10:32:29");</script>
<script>addRow("all","all",1,0,"0 B",1664291176,"2022/9/27 晚上11:06:16");</script>
<script>addRow("batchinstallerv1","batchinstallerv1",1,0,"0 B",1666482604,"2022/10/23 清晨7:50:04");</script>
<script>addRow("BOOKS","BOOKS",1,0,"0 B",1664789004,"2022/10/3 下午5:23:24");</script>
<script>addRow("DiskGenius","DiskGenius",1,0,"0 B",1664844348,"2022/10/4 上午8:45:48");</script>
<script>addRow("doc","doc",1,0,"0 B",1665880576,"2022/10/16 上午8:36:16");</script>
<script>addRow("dosbox","dosbox",1,0,"0 B",1666288708,"2022/10/21 凌晨1:58:28");</script>
<script>addRow("DOSBox-Win31","DOSBox-Win31",1,0,"0 B",1666434321,"2022/10/22 下午6:25:21");</script>
<script>addRow("downloader","downloader",1,0,"0 B",1666063320,"2022/10/18 上午11:22:00");</script>
<script>addRow("enchcracker-1.6","enchcracker-1.6",1,0,"0 B",1662251626,"2022/9/4 上午8:33:46");</script>
<script>addRow("fontsifound","fontsifound",1,0,"0 B",1666434247,"2022/10/22 下午6:24:07");</script>
<script>addRow("githoup","githoup",1,0,"0 B",1664896119,"2022/10/4 晚上11:08:39");</script>
<script>addRow("img","img",1,0,"0 B",1664894076,"2022/10/4 晚上10:34:36");</script>
<script>addRow("java","java",1,0,"0 B",1666067188,"2022/10/18 中午12:26:28");</script>
<script>addRow("javabuild","javabuild",1,0,"0 B",1665933493,"2022/10/16 晚上11:18:13");</script>
<script>addRow("mc1.5 textures","mc1.5%20textures",1,0,"0 B",1666088572,"2022/10/18 下午6:22:52");</script>
<script>addRow("mcmod","mcmod",1,0,"0 B",1664887214,"2022/10/4 晚上8:40:14");</script>
<script>addRow("minecraft1.5.2","minecraft1.5.2",1,0,"0 B",1666067187,"2022/10/18 中午12:26:27");</script>
<script>addRow("MP3","MP3",1,0,"0 B",1664789003,"2022/10/3 下午5:23:23");</script>
<script>addRow("MultiMC","MultiMC",1,0,"0 B",1664857896,"2022/10/4 中午12:31:36");</script>
<script>addRow("nbtedit","nbtedit",1,0,"0 B",1661310447,"2022/8/24 上午11:07:27");</script>
<script>addRow("pal_dos","pal_dos",1,0,"0 B",1666288803,"2022/10/21 凌晨2:00:03");</script>
<script>addRow("ps2","ps2",1,0,"0 B",1661323771,"2022/8/24 下午2:49:31");</script>
<script>addRow("pyinstaler","pyinstaler",1,0,"0 B",1666082251,"2022/10/18 下午4:37:31");</script>
<script>addRow("pyloris-3.2","pyloris-3.2",1,0,"0 B",1666075533,"2022/10/18 下午2:45:33");</script>
<script>addRow("Python26","Python26",1,0,"0 B",1666075497,"2022/10/18 下午2:44:57");</script>
<script>addRow("REMINDER","REMINDER",1,0,"0 B",1664789004,"2022/10/3 下午5:23:24");</script>
<script>addRow("Scan","Scan",1,0,"0 B",1665318383,"2022/10/9 晚上8:26:23");</script>
<script>addRow("sdpal","sdpal",1,0,"0 B",1666420743,"2022/10/22 下午2:39:03");</script>
<script>addRow("text","text",1,0,"0 B",1666511372,"2022/10/23 下午3:49:32");</script>
<script>addRow("videoplay","videoplay",1,0,"0 B",1666474025,"2022/10/23 清晨5:27:05");</script>
<script>addRow("web","web",1,0,"0 B",1666088211,"2022/10/18 下午6:16:51");</script>
<script>addRow("WIN31","WIN31",1,0,"0 B",1666616474,"2022/10/24 晚上9:01:14");</script>
<script>addRow("WOR","WOR",1,0,"0 B",1660544944,"2022/8/15 下午2:29:04");</script>
<script>addRow("zip","zip",1,0,"0 B",1664111709,"2022/9/25 晚上9:15:09");</script>
<script>addRow("0.fat","0.fat",0,268435456,"256 MB",1664544404,"2022/9/30 晚上9:26:44");</script>
<script>addRow("1.img","1.img",0,1736441856,"1.6 GB",1664543976,"2022/9/30 晚上9:19:36");</script>
<script>addRow("1.wav","1.wav",0,693164,"677 kB",960483600,"2000/6/9 凌晨1:00:00");</script>
<script>addRow("2.wav","2.wav",0,6718,"6.6 kB",960483600,"2000/6/9 凌晨1:00:00");</script>
<script>addRow("7zip.lnk","7zip.lnk",0,1361,"1.3 kB",1647352380,"2022/3/15 晚上9:53:00");</script>
<script>addRow("8514SYS.FON","8514SYS.FON",0,9280,"9.1 kB",1666282622,"2022/10/21 凌晨12:17:02");</script>
<script>addRow("888gf.jpg","888gf.jpg",0,696842,"681 kB",1663856005,"2022/9/22 晚上10:13:25");</script>
<script>addRow("多開管理器.lnk","%E5%A4%9A%E9%96%8B%E7%AE%A1%E7%90%86%E5%99%A8.lnk",0,973,"973 B",1662806920,"2022/9/10 下午6:48:40");</script>
<script>addRow("系統.lnk","%E7%B3%BB%E7%B5%B1.lnk",0,453,"453 B",1662797284,"2022/9/10 下午4:08:04");</script>
<script>addRow("逍遙模擬器.lnk","%E9%80%8D%E9%81%99%E6%A8%A1%E6%93%AC%E5%99%A8.lnk",0,934,"934 B",1662806920,"2022/9/10 下午6:48:40");</script>
<script>addRow("新文字文件 (2).txt","%E6%96%B0%E6%96%87%E5%AD%97%E6%96%87%E4%BB%B6%20(2).txt",0,57,"57 B",1666077931,"2022/10/18 下午3:25:31");</script>
<script>addRow("新文字文件.txt","%E6%96%B0%E6%96%87%E5%AD%97%E6%96%87%E4%BB%B6.txt",0,5,"5 B",1664214301,"2022/9/27 凌晨1:45:01");</script>
<script>addRow("螢幕擷取畫面 2022-10-23 103404.png","%E8%9E%A2%E5%B9%95%E6%93%B7%E5%8F%96%E7%95%AB%E9%9D%A2%202022-10-23%20103404.png",0,482549,"471 kB",1666492451,"2022/10/23 上午10:34:11");</script>
<script>addRow("assets.zip","assets.zip",0,6509604,"6.2 MB",1665996012,"2022/10/17 下午4:40:12");</script>
<script>addRow("Bad Apple .exe","Bad%20Apple%20.exe",0,14807040,"14.1 MB",1666101474,"2022/10/18 晚上9:57:54");</script>
<script>addRow("Bad Apple Console.exe","Bad%20Apple%20Console.exe",0,22539264,"21.5 MB",1666101674,"2022/10/18 晚上10:01:14");</script>
<script>addRow("Bad Apple.mp3","Bad%20Apple.mp3",0,3503366,"3.3 MB",1666101674,"2022/10/18 晚上10:01:14");</script>
<script>addRow("badapple.mp4","badapple.mp4",0,22711433,"21.7 MB",1666473339,"2022/10/23 清晨5:15:39");</script>
<script>addRow("Bat_To_Exe_Converter_(Installer).exe","Bat_To_Exe_Converter_(Installer).exe",0,4482593,"4.3 MB",1594198791,"2020/7/8 下午4:59:51");</script>
<script>addRow("bb.bin","bb.bin",0,51379928,"49.0 MB",1666280748,"2022/10/20 晚上11:45:48");</script>
<script>addRow("BG.png","BG.png",0,8701,"8.5 kB",1666290317,"2022/10/21 凌晨2:25:17");</script>
<script>addRow("Black Thatch.bmp","Black%20Thatch.bmp",0,182,"182 B",960454800,"2000/6/8 下午5:00:00");</script>
<script>addRow("Blockbench.lnk","Blockbench.lnk",0,2369,"2.3 kB",1664108339,"2022/9/25 晚上8:18:59");</script>
<script>addRow("Bubbles.bmp","Bubbles.bmp",0,2118,"2.1 kB",960454800,"2000/6/8 下午5:00:00");</script>
<script>addRow("chicken.png","chicken.png",0,472,"472 B",1654566110,"2022/6/7 上午9:41:50");</script>
<script>addRow("chickenbeautiful-1.12.2-2.0(已修蹦端BUG).zip","chickenbeautiful-1.12.2-2.0(%E5%B7%B2%E4%BF%AE%E8%B9%A6%E7%AB%AFBUG).zip",0,232381,"227 kB",1664109222,"2022/9/25 晚上8:33:42");</script>
<script>addRow("CLOUD.GIF","CLOUD.GIF",0,11306,"11.0 kB",960454800,"2000/6/8 下午5:00:00");</script>
<script>addRow("Compliance Resource Pack.lnk","Compliance%20Resource%20Pack.lnk",0,2804,"2.7 kB",1644053574,"2022/2/5 下午5:32:54");</script>
<script>addRow("computerinfo.html","computerinfo.html",0,162564,"159 kB",1664893905,"2022/10/4 晚上10:31:45");</script>
<script>addRow("decompile.html","decompile.html",0,3474,"3.4 kB",1666088257,"2022/10/18 下午6:17:37");</script>
<script>addRow("desktop.ini","desktop.ini",0,658,"658 B",1660375804,"2022/8/13 下午3:30:04");</script>
<script>addRow("Discord.lnk","Discord.lnk",0,2245,"2.2 kB",1666496807,"2022/10/23 上午11:46:47");</script>
<script>addRow("dosbox.conf","dosbox.conf",0,136,"136 B",1666288803,"2022/10/21 凌晨2:00:03");</script>
<script>addRow("DR.PC F@MILY電腦『學與教』.lnk","DR.PC%20F@MILY%E9%9B%BB%E8%85%A6%E3%80%8E%E5%AD%B8%E8%88%87%E6%95%99%E3%80%8F.lnk",0,2818,"2.8 kB",1650700438,"2022/4/23 下午3:53:58");</script>
<script>addRow("draw_badapple_in_terminal(video+audio).py","draw_badapple_in_terminal(video+audio).py",0,2581,"2.5 kB",1666105326,"2022/10/18 晚上11:02:06");</script>
<script>addRow("ERROR422.exe","ERROR422.exe",0,8417280,"8.0 MB",1580274481,"2020/1/29 下午1:08:01");</script>
<script>addRow("EV录屏.lnk","EV%E5%BD%95%E5%B1%8F.lnk",0,1179,"1.2 kB",1630028219,"2021/8/27 上午9:36:59");</script>
<script>addRow("EV剪辑.lnk","EV%E5%89%AA%E8%BE%91.lnk",0,1165,"1.1 kB",1628579267,"2021/8/10 下午3:07:47");</script>
<script>addRow("fake shutdown.html","fake%20shutdown.html",0,38,"38 B",1666077024,"2022/10/18 下午3:10:24");</script>
<script>addRow("fax3855khz.png","fax3855khz.png",0,924178,"903 kB",1664288442,"2022/9/27 晚上10:20:42");</script>
<script>addRow("GitHub Desktop.lnk","GitHub%20Desktop.lnk",0,2385,"2.3 kB",1664862440,"2022/10/4 下午1:47:20");</script>
<script>addRow("hh.zip","hh.zip",0,20769132,"19.8 MB",1666280807,"2022/10/20 晚上11:46:47");</script>
<script>addRow("homework.txt","homework.txt",0,0,"0 B",1666279468,"2022/10/20 晚上11:24:28");</script>
<script>addRow("HorionInjector (3).exe","HorionInjector%20(3).exe",0,151040,"148 kB",1634123865,"2021/10/13 晚上7:17:45");</script>
<script>addRow("icon.png","icon.png",0,30054,"29.3 kB",1665933481,"2022/10/16 晚上11:18:01");</script>
<script>addRow("index.html","index.html",0,201326,"197 kB",1660895139,"2022/8/19 下午3:45:39");</script>
<script>addRow("Internet Explorer.lnk","Internet%20Explorer.lnk",0,1343,"1.3 kB",1659281611,"2022/7/31 晚上11:33:31");</script>
<script>addRow("ipscanner.jar","ipscanner.jar",0,2363638,"2.3 MB",1663422623,"2022/9/17 晚上9:50:23");</script>
<script>addRow("javabuildertools.zip","javabuildertools.zip",0,3099,"3.0 kB",1664856927,"2022/10/4 中午12:15:27");</script>
<script>addRow("javaws.exe","javaws.exe",0,457424,"447 kB",1659585823,"2022/8/4 中午12:03:43");</script>
<script>addRow("lnm.txt","lnm.txt",0,8,"8 B",1665312524,"2022/10/9 下午6:48:44");</script>
<script>addRow("MCreator.lnk","MCreator.lnk",0,969,"969 B",1664198662,"2022/9/26 晚上9:24:22");</script>
<script>addRow("Microsoft Edge.lnk","Microsoft%20Edge.lnk",0,2341,"2.3 kB",1654115981,"2022/6/2 凌晨4:39:41");</script>
<script>addRow("Minecraft Launcher.lnk","Minecraft%20Launcher.lnk",0,1319,"1.3 kB",1659058733,"2022/7/29 上午9:38:53");</script>
<script>addRow("Minecraft.lnk","Minecraft.lnk",0,1693,"1.7 kB",1663164384,"2022/9/14 晚上10:06:24");</script>
<script>addRow("MinecraftHDbackground.zip","MinecraftHDbackground.zip",0,11901910,"11.4 MB",1664892826,"2022/10/4 晚上10:13:46");</script>
<script>addRow("minerpage.png","minerpage.png",0,22349,"21.8 kB",1664865173,"2022/10/4 下午2:32:53");</script>
<script>addRow("mod.png","mod.png",0,325308,"318 kB",1664643112,"2022/10/2 凌晨12:51:52");</script>
<script>addRow("mpv-x86_64-20221016-git-cdcbd73.7z","mpv-x86_64-20221016-git-cdcbd73.7z",0,25855197,"24.7 MB",1666473086,"2022/10/23 清晨5:11:26");</script>
<script>addRow("MultiMC.lnk","MultiMC.lnk",0,1071,"1.0 kB",1658754530,"2022/7/25 晚上9:08:50");</script>
<script>addRow("pack.png","pack.png",0,27267,"26.6 kB",1640432902,"2021/12/25 晚上7:48:22");</script>
<script>addRow("panorama0.png","panorama0.png",0,71767,"70.1 kB",1664110854,"2022/9/25 晚上9:00:54");</script>
<script>addRow("panorama1.png","panorama1.png",0,89196,"87.1 kB",1664110972,"2022/9/25 晚上9:02:52");</script>
<script>addRow("panorama2.png","panorama2.png",0,87261,"85.2 kB",1664111006,"2022/9/25 晚上9:03:26");</script>
<script>addRow("panorama3.png","panorama3.png",0,5057298,"4.8 MB",1664111258,"2022/9/25 晚上9:07:38");</script>
<script>addRow("panorama4.png","panorama4.png",0,18683,"18.2 kB",1664111414,"2022/9/25 晚上9:10:14");</script>
<script>addRow("panorama5.png","panorama5.png",0,111182,"109 kB",1664111468,"2022/9/25 晚上9:11:08");</script>
<script>addRow("paytheprice.png","paytheprice.png",0,87034,"85.0 kB",1640436576,"2021/12/25 晚上8:49:36");</script>
<script>addRow("Resource Hacker.lnk","Resource%20Hacker.lnk",0,1180,"1.2 kB",1654099864,"2022/6/2 凌晨12:11:04");</script>
<script>addRow("s.bat","s.bat",0,960,"960 B",1666279704,"2022/10/20 晚上11:28:24");</script>
<script>addRow("Scratch 3.lnk","Scratch%203.lnk",0,2417,"2.4 kB",1657169155,"2022/7/7 中午12:45:55");</script>
<script>addRow("screen rebuild.bat","screen%20rebuild.bat",0,21562,"21.1 kB",1664293228,"2022/9/27 晚上11:40:28");</script>
<script>addRow("Setup.bmp","Setup.bmp",0,308280,"301 kB",960454800,"2000/6/8 下午5:00:00");</script>
<script>addRow("ssText3d.scr","ssText3d.scr",0,198656,"194 kB",1575709786,"2019/12/7 下午5:09:46");</script>
<script>addRow("start.bat","start.bat",0,784,"784 B",1660634484,"2022/8/16 下午3:21:24");</script>
<script>addRow("timeoutoutput.log","timeoutoutput.log",0,5936,"5.8 kB",1664546447,"2022/9/30 晚上10:00:47");</script>
<script>addRow("TurboWarp.lnk","TurboWarp.lnk",0,2429,"2.4 kB",1658841363,"2022/7/26 晚上9:16:03");</script>
<script>addRow("Unity Hub.lnk","Unity%20Hub.lnk",0,1889,"1.8 kB",1650717827,"2022/4/23 晚上8:43:47");</script>
<script>addRow("updater.bat","updater.bat",0,499,"499 B",1665880576,"2022/10/16 上午8:36:16");</script>
<script>addRow("VB6.lnk","VB6.lnk",0,1737,"1.7 kB",1663326628,"2022/9/16 晚上7:10:28");</script>
<script>addRow("Vbsedit.lnk","Vbsedit.lnk",0,1235,"1.2 kB",1654113754,"2022/6/2 凌晨4:02:34");</script>
<script>addRow("vgalogo.png","vgalogo.png",0,15413,"15.1 kB",1666287828,"2022/10/21 凌晨1:43:48");</script>
<script>addRow("Visual Studio Code.lnk","Visual%20Studio%20Code.lnk",0,1416,"1.4 kB",1650717576,"2022/4/23 晚上8:39:36");</script>
<script>addRow("webdosbox.zip","webdosbox.zip",0,30618933,"29.2 MB",1666615973,"2022/10/24 晚上8:52:53");</script>
<script>addRow("win404eff.sb3","win404eff.sb3",0,219116,"214 kB",1666488841,"2022/10/23 上午9:34:01");</script>
<script>addRow("WINHLP32.EXE","WINHLP32.EXE",0,336400,"329 kB",1666282637,"2022/10/21 凌晨12:17:17");</script>
<script>addRow("youtube link.bmp","youtube%20link.bmp",0,921654,"900 kB",1664644894,"2022/10/2 凌晨1:21:34");</script>
<script>addRow("zbicon.png","zbicon.png",0,12342,"12.1 kB",1666279427,"2022/10/20 晚上11:23:47");</script>
</body></html>
