import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/helpers/program_type_enum.dart';
import '../../../core/widgets/fides_snack_bar.dart';
import '../../../../domain/entities/loyalty_program_entity.dart';
import '../../../../services/helpers/app_route_enum.dart';
import '../../../core/widgets/loader.dart';
import '../../../homePage/ui/widgets/program_card.dart';
import '../bloc/loyalty_program_bloc.dart';

class Programs extends StatelessWidget {
  Programs({super.key});

  bool allPrograms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoyaltyProgramBloc, LoyaltyProgramState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            return showSnackBar(context, state.message!);
          }
        },
        builder: (context, state) {
          final List<Object> allPrograms = state.listOfSelectedProgram!;
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: Text('Programs'),
                  actions: [
                    IconButton(onPressed: () => context.pushNamed(AppRoute.selectLoyaltyProgram.name), icon: Icon(Icons.add_circle)),
                  ],
                ),
                SliverAppBar(
                  pinned: true,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 16,
                        children: [
                          FilterChip(
                            label: Text('All'),
                            showCheckmark: false,
                            selected: state.allFilter!,
                            onSelected: (bool value) {
                              context.read<LoyaltyProgramBloc>().add(AllPrograms());
                            },
                          ),
                          ...ProgramType.values.where((type) => type != ProgramType.unknown).map(
                                (type) => FilterChip(
                                  label: Text(type.label),
                                  showCheckmark: false,
                                  selected: (state.selectedFilterProgram ?? false) == type,
                                  avatar: SvgPicture.asset(
                                    type.iconPath,
                                    width: 20,
                                    height: 20,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context).colorScheme.onSurfaceVariant,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  onSelected: (bool value) {
                                    context.read<LoyaltyProgramBloc>().add(FilterProgram(type));
                                  },
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state.listOfPrograms!.values.isEmpty) ...{
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text('Tap on the + button top left to create a program'),
                    ),
                  ),
                },
                SliverPadding(
                  padding: EdgeInsets.all(16.0),
                  sliver: SliverToBoxAdapter(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final double width = constraints.maxWidth;
                        int columns;

                        if (width >= 1024) {
                          columns = 4; // Desktop
                        } else if (width >= 600) {
                          columns = 3; // Tablet
                        } else {
                          columns = 2; // Mobile
                        }

                        if (state.status == Status.loading) {
                          return Center(child: Loader());
                        }

                        return LayoutGrid(
                          columnSizes: List.generate(columns, (_) => auto),
                          rowSizes: List<TrackSize>.generate((allPrograms.length / columns).ceil(), (_) => auto),
                          columnGap: 8,
                          rowGap: 8,
                          autoPlacement: AutoPlacement.rowSparse,
                          children: allPrograms.map((program) => ProgramCard(program: program)).toList(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
