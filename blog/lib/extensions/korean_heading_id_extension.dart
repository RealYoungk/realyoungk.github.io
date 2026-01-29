import 'package:jaspr_content/jaspr_content.dart';

/// Extension that fixes heading IDs for Korean text.
/// Must be applied BEFORE HeadingAnchorsExtension and TableOfContentsExtension.
///
/// The Dart markdown package's generateAnchorHash strips all non-ASCII characters,
/// so Korean headings like "기본 정보", "주요 사업", "핵심 파이프라인" all get the
/// same id="-". This breaks TOC navigation.
///
/// This extension walks all heading elements (h1-h6) and replaces their id attribute
/// with a unique, sequential slug based on the heading text. For Korean-only text,
/// it uses a counter-based ID like "section-1", "section-2", etc.
class KoreanHeadingIdExtension implements PageExtension {
  const KoreanHeadingIdExtension();

  static final _headerRegex = RegExp(r'^h[1-6]$', caseSensitive: false);

  @override
  Future<List<Node>> apply(Page page, List<Node> nodes) async {
    final usedIds = <String>{};
    return _processNodes(nodes, usedIds);
  }

  List<Node> _processNodes(List<Node> nodes, Set<String> usedIds) {
    return nodes.map((node) {
      if (node is! ElementNode) return node;

      // Check if this is a heading element
      if (_headerRegex.hasMatch(node.tag)) {
        final currentId = node.attributes['id'];
        if (currentId != null) {
          // Generate a new unique ID based on the heading text
          final newId = _generateUniqueId(node.innerText, usedIds);

          // Create a new ElementNode with the updated id attribute
          return ElementNode(
            node.tag,
            {...node.attributes, 'id': newId},
            node.children != null ? _processNodes(node.children!, usedIds) : null,
          );
        }
      }

      // Recursively process children if they exist
      if (node.children != null) {
        return ElementNode(
          node.tag,
          node.attributes,
          _processNodes(node.children!, usedIds),
        );
      }

      return node;
    }).toList();
  }

  String _generateUniqueId(String text, Set<String> usedIds) {
    // Generate slug: keep alphanumeric and Korean characters
    var slug = text
        .toLowerCase()
        .trim()
        // Keep Korean (가-힣), alphanumeric, and hyphens
        .replaceAll(RegExp(r'[^\w\s가-힣a-z0-9-]'), '')
        // Replace whitespace with hyphens
        .replaceAll(RegExp(r'\s+'), '-')
        // Collapse multiple hyphens
        .replaceAll(RegExp(r'-+'), '-')
        // Trim leading/trailing hyphens
        .replaceAll(RegExp(r'^-|-$'), '');

    // If slug is empty or only hyphens after processing, use generic prefix
    if (slug.isEmpty || slug == '-') {
      slug = 'section';
    }

    // Ensure uniqueness by appending counter if needed
    var finalId = slug;
    var counter = 1;
    while (usedIds.contains(finalId)) {
      finalId = '$slug-$counter';
      counter++;
    }
    usedIds.add(finalId);
    return finalId;
  }
}
