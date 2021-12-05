import fs from "fs";
import path from "path";
import { ABAP } from "@abaplint/runtime";

async function run() {
  let day = process.argv[2];
  // for debugging
  if (!day) {
    day = "01";
  }
  console.log("# Day " + day);

  const files = fs
    .readdirSync("output")
    .filter((n) => n.includes("day" + day) && n.endsWith(".clas.mjs"));
  if (files.length !== 1) {
    throw "Class not found for this day";
  }

  const abap = new ABAP();
  global.abap = abap;
  const clas = await import("." + path.sep + "output" + path.sep + files[0]);

  const inputFile = "." + path.sep + "input" + path.sep + "day" + day + ".txt";
  const input = fs.readFileSync(inputFile).toString();

  const className = Object.keys(clas)[0];
  console.log("Class Name:", className);
  const instance = new clas[className]();
  const methodName = Object.getOwnPropertyNames(
    clas[className].prototype
  ).filter((m) => m.endsWith("$solve"))[0];
  console.log("Class: " + className.toUpperCase());
  console.log("Method: " + methodName.toUpperCase());
  console.log("Input: " + inputFile);

  const result = await instance[methodName]({ input: input });
  const output = abap.console.get();
  if (output && output !== "") {
    console.dir(output);
  }

  console.log("\nResult:");
  console.log(result);
}

run()
  .then(() => {
    process.exit();
  })
  .catch((err) => {
    console.log(err);
    process.exit(1);
  });
