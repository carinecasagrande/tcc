import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  img: {
    width: 90,
    height: 90,
    flexDirection: 'row',
    flex: 1,
  },
  content: {
    padding: 20,
    justifyContent: 'center', // Eixo primário (Y)
    alignItems: 'center', // Eixo secundário (X)
  },
  algorithm: {
    paddingLeft: 20,
  },
  title: {
    fontWeight: 'bold',
    fontSize: 20,
    textAlign: 'center',
    marginTop: 10,
  },
  titlePaperwork: {
    fontWeight: 'bold',
    fontSize: 20,
    textAlign: 'center',
    marginTop: 40,
  },
  subtitlePaperwork: {
    fontSize: 20,
    textAlign: 'center',
  },
  subtitle: {
    fontSize: 20,
    textAlign: 'center',
    marginTop: 40,
    marginBottom: 10,
  },
  button: {
    backgroundColor: '#f1641f',
    padding: 18,
    borderRadius: 10,
    alignSelf: 'stretch',
    marginTop: 20,
    marginBottom: 10,
  },
  buttonText: {
    textAlign: 'center',
    color: '#ffffff',
    fontSize: 20,
    fontWeight: 'bold',
  },
  buttonAbout: {
    fontSize: 20,
    color: '#f1641f',
  },
});
