#let slidehead(title, color: white) = {
  let title = [
    #set text(fill: color)
    #box(
      inset: (x: 6pt),
      title
    )
  ];
  let tag-color = color;

  style(styles => {
    let title-size = measure(title, styles)

    let tag-width = 20pt;

    let tag-flare-width = 12pt;
    let tag-flare = polygon(fill: tag-color,
      (0pt, 0pt),
      (tag-width + 0pt, 0pt),
      (tag-width + tag-flare-width, title-size.height / 2),
      (tag-width + 0pt, title-size.height),
      (0pt, title-size.height),
    );
    let tag-flare2 = polygon(fill: tag-color,
      (0pt, 0pt),
      (tag-flare-width, 0pt),
      (tag-flare-width + 100%, 0pt),
      (tag-flare-width + 100%, title-size.height),
      (tag-flare-width, title-size.height),
      (0pt, title-size.height),
      (tag-flare-width, title-size.height / 2),

    );
    stack(
      dir: direction.ltr,
      tag-flare,
      title,
      tag-flare2,
      // rect(width: 100%, height: title-size.height, fill: color),
    )
  })
}
