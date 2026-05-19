import 'package:nour_arch/features/member/data/models/member_model.dart';
import 'asset_paths.dart';

final teamMembers = [
  // ── Nour Elsayed ──────────────────────────────────────────────────────────
  MemberModel(
    name: 'Nour Elsayed',
    projectName: 'New Mansoura Gate',
    panoramaPath: AssetPaths.nourPanorama,
    images: const [
      MemberImageModel(
        path: AssetPaths.nourPoster1,
        title: 'New Mansoura Gate',
        description:
            'The gateway is conceived not as a static object, but as a transforming spatial experience that responds to direction, motion, light, and time.',
        designer: 'Arch. Nour Elsayed',
      ),
      MemberImageModel(
        path: AssetPaths.nourPoster2,
        title: 'Perspective Analysis',
        description:
            'The gateway uses layered vertical fins with slight rotation to create a shifting visual effect. '
            'Approaching vehicles reveal an open central void and city identity, while the opposite view compresses the fins into a solid form. '
            'The illusion depends on perspective, light, and movement—while the structure itself stays static.',
        designer: 'Arch. Nour Elsayed',
      ),
      MemberImageModel(
        path: AssetPaths.nourPoster3,
        title: 'Shadow Analysis',
        description:
            'As sunlight passes through the layered vertical fins, dynamic shadows are projected onto the ground, forming abstract patterns inspired by wheat fields and agricultural flow. '
            'The shadow composition changes throughout the day, creating a living visual connection between light, movement, and the agricultural identity of old Mansoura.',
        designer: 'Arch. Nour Elsayed',
      ),
      MemberImageModel(
        path: AssetPaths.nourPoster4,
        title: 'The Poster and Full Mechanism',
        description:
            'A high-end architectural presentation board showcasing the "New Mansoura Gate" as a dynamic, interactive gateway.',
        designer: 'Arch. Nour Elsayed',
      ),
    ],
  ),

  // ── Mahmoud Shier ─────────────────────────────────────────────────────────
  MemberModel(
    name: 'Mahmoud Shier',
    projectName: 'ElDelta Square',
    panoramaPath: AssetPaths.shierPanorama,
    images: const [
      MemberImageModel(
        path: AssetPaths.shierPoster1,
        title: 'ElDelta Square',
        description:
            'Modern wheat spike inspired monument in the center of a wide roundabout, Elegant curved forms with warm lighting and water channels.',
        designer: 'Arch. Mahmoud Shier',
      ),
      MemberImageModel(
        path: AssetPaths.shierPoster2,
        title: 'Master Plan',
        description:
            'A high-angle architectural layout showcasing the organic, fluid design of the roundabout landscape.',
        designer: 'Arch. Mahmoud Shier',
      ),
      MemberImageModel(
        path: AssetPaths.shierPoster3,
        title: 'Design Presentation',
        description:
            'A comprehensive project poster detailing the conceptual and technical aspects of the "Gate of the Land" monument.',
        designer: 'Arch. Mahmoud Shier',
      ),
    ],
  ),

  // ── Mohamed Amin ──────────────────────────────────────────────────────────
  MemberModel(
    name: 'Mohamed Amin',
    projectName: 'ELNahda Square',
    panoramaPath: AssetPaths.aminPanorama,
    images: const [
      MemberImageModel(
        path: AssetPaths.aminPoster1,
        title: 'ELNahda Square',
        description:
            'Modern futuristic monument at the center of a roundabout near the waterfront, Dynamic curved forms with blue lighting and surrounding fountains.',
        designer: 'Arch. Mohamed Amin',
      ),
      MemberImageModel(
        path: AssetPaths.aminPoster2,
        title: 'Front View',
        description:
            'A stylized digital illustration of the futuristic landmark, showcasing its sleek architectural frontal profile.',
        designer: 'Arch. Mohamed Amin',
      ),
      MemberImageModel(
        path: AssetPaths.aminPoster3,
        title: 'Side View',
        description:
            'A side-angle digital illustration emphasizing the elegant, aerodynamic curvature of the structure.',
        designer: 'Arch. Mohamed Amin',
      ),
      MemberImageModel(
        path: AssetPaths.aminPoster4,
        title: 'Master Plan',
        description:
            'A comprehensive top-down architectural layout of the roundabout and its surrounding urban development.',
        designer: 'Arch. Mohamed Amin',
      ),
    ],
  ),
];
