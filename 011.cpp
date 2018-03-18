double PowerNormal(double base int exponent)
{
  if(exponent == 0)
  return 1;
  else if(exponent == 1)
  return base;
  double res = PowerNormal(base,exponent >> 1);
  res *= res;
  if((exponent & 1) == 1)
  {
    res *= base;
  }
  return res;
}
