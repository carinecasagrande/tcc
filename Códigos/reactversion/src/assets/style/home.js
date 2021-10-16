import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  content: {
    padding: 20,
    justifyContent: 'center', // Eixo primário (Y)
    alignItems: 'center', // Eixo secundário (X)
  },
  content2: {
    paddingHorizontal: 20,
    paddingBottom: 20,
    justifyContent: 'center', // Eixo primário (Y)
    alignItems: 'center', // Eixo secundário (X)
  },
  img: {
    width: 90,
    height: 90,
    flexDirection: 'row',
    flex: 1,
  },
  title: {
    fontWeight: '800',
    color: 'black',
    fontSize: 17,
    textAlign: 'center',
  },
  subtitle: {
    fontWeight: '500',
    textAlign: 'center',
    marginTop: 30,
    marginBottom: 10,
    color: 'black',
    fontSize: 17,
  },
  algorithm: {
    marginTop: -20,
    paddingLeft: 20,
  },
  button: {
    backgroundColor: '#f1641f',
    padding: 18,
    borderRadius: 10,
    alignSelf: 'stretch',
    marginTop: 30,
    marginBottom: 10,
  },
  buttonText: {
    textAlign: 'center',
    color: '#ffffff',
    fontSize: 17,
    fontWeight: '800',
  },
  buttonAbout: {
    color: '#f1641f',
    fontSize: 17,
    fontWeight: '500',
  },
});
