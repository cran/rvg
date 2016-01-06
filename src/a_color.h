class a_color
{
public:
  a_color (int);
  int is_visible();
  int has_alpha();
  std::string solid_fill();
  std::string solid_fill_w14();
  std::string w_color();
  std::string svg_fill_attr();
  std::string svg_stroke_attr();
  int is_transparent();

private:
  int col;
  int alpha;
};
