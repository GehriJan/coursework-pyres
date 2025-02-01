#import "@preview/timeliney:0.1.0": *

#set page(flipped: true, columns: 1)
#figure(
    timeline(
      show-grid: true,
      {

        headerline(
          group(([*2024/Q4*], 3)),
          group(([*2025/Q1*], 3)),
          group(([*2025/Q2*], 3)),
        )
        headerline(
          group(..("Oct", "Nov", "Dec").map(n => strong(n))),
          group(..("Jan", "Feb", "Mar").map(n => strong(n))),
          group(..("Apr", "May", "Jun").map(n => strong(n))),
        )

        taskgroup(title: [*Research*], {
          task("Research the market", (0, 2), style: (stroke: 2pt + gray))
          task("Conduct user surveys", (1, 3), style: (stroke: 2pt + gray))
        })

        taskgroup(title: [*Development*], {
          task("Develop & Test MVP", (2, 3), style: (stroke: 2pt + gray))
          task("Iterative Dev Cycle", (3, 5), style: (stroke: 2pt + gray))
          task("Close Dev Phase", (3.5, 6), style: (stroke: 2pt + gray))
        })

        taskgroup(title: [*Writing thesis*], {
          task("Write", (3.5, 7), style: (stroke: 2pt + gray))
          task("Social media advertising", (6, 7.5), style: (stroke: 2pt + gray))
        })

        milestone(
          at: 3.75,
          style: (stroke: (dash: "dashed")),
          align(center, [
            *Conference demo*\
            Dec 2023
          ])
        )

        milestone(
          at: 6.5,
          style: (stroke: (dash: "dashed")),
          align(center, [
            *App store launch*\
            Aug 2024
          ])
        )
      }
    ),
  )