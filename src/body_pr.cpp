#include <Rcpp.h>
#include "body_pr.h"
#include <iostream>

using namespace Rcpp;

std::string body_pr::a_tag()
{
  std::stringstream os;

  os << "<a:bodyPr ";
  os << "lIns=\"0\" rIns=\"0\" tIns=\"0\" bIns=\"0\" ";
  os << "anchorCtr=\"1\" anchor=\"ctr\"/>";
  os << "<a:lstStyle/>";

  return os.str();
}

std::string body_pr::wps_tag()
{
  std::stringstream os;
  // fputs("spcFirstLastPara=\"0\"/>", dml_dev->file );

  os << "<wps:bodyPr ";
  os << "lIns=\"0\" rIns=\"0\" tIns=\"0\" bIns=\"0\" ";
  os << "anchor=\"b\" ";
  os << "vertOverflow=\"overflow\" horzOverflow=\"overflow\" vert=\"horz\">";
  // os << "<a:spAutoFit/>";
  os << "</wps:bodyPr>";
  return os.str();
}
