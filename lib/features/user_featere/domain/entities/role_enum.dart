enum RoleEnum 
{
  user('user'),
  admin('admin'),
  owner('owner');

  final String value;

  const RoleEnum(this.value);

  factory RoleEnum.fromStrig(String role)
  {
    return RoleEnum.values.firstWhere(
      (element) => element.value.toLowerCase() == role.toLowerCase(),
      orElse: () => RoleEnum.user,
    );
  }

}